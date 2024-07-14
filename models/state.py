#!/usr/bin/python3
""" State Module for HBNB project """
import os
from models.base_model import BaseModel
from sqlalchemy import Integer,Column , String
from sqlalchemy.orm import relationship


class State(BaseModel):
    """ State class """
    __tablename__ = 'states'
    name = Column ( String(128), nullable=False)