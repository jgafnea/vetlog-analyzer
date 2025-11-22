#  Copyright 2025 Jose Morales contact@josdem.io
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License

import os
from unittest.mock import MagicMock

from py_vetlog_analyzer.database_connector import Connector


def test_database_connector_with_env(mocker):
    """Test database connector uses environment variables correctly"""

    # Mock the mysql.connector.connect function
    mock_connection = MagicMock()
    mock_connect = mocker.patch("mysql.connector.connect", return_value=mock_connection)

    # Set environment variables
    mocker.patch.dict(
        os.environ,
        {
            "HOST": "localhost",
            "DATABASE": "vetlog",
            "VETLOG_USER": "vetlogUser",
            "VETLOG_PASSWORD": "vetlogPass",
        },
    )

    # Create connector
    connector = Connector()

    # Verify connect was called with correct parameters
    mock_connect.assert_called_once_with(
        host="localhost", user="vetlogUser", password="vetlogPass", database="vetlog"
    )

    # Verify connector returns the mocked connection
    assert connector.get_connector() == mock_connection


def test_database_connector_without_env(mocker):
    """Test database connector handles missing environment variables"""
    mock_connection = MagicMock()
    mocker.patch("mysql.connector.connect", return_value=mock_connection)

    # Clear environment variables
    mocker.patch.dict(os.environ, {}, clear=True)

    connector = Connector()

    # Should still work but with None values
    assert connector.get_connector() == mock_connection
