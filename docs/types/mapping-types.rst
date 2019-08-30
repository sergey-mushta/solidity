.. index:: !mapping
.. _mapping-types:

Mapping Types
=============

Mapping types use the syntax ``mapping(_KeyType => _ValueType)`` and variables
are declared as a mapping type using the syntax ``mapping (_KeyType => _ValueType) _VariableModifiers _VariableName``.
The ``_KeyType`` can be any elementary type. This means it can be any of
the built-in value types plus ``bytes`` and ``string``. User-defined
or complex types like contract types, enums, mappings, structs and any array type
apart from ``bytes`` and ``string`` are not allowed.
``_ValueType`` can be any type, including mappings.

You can think of mappings as `hash tables <https://en.wikipedia.org/wiki/Hash_table>`_, which are virtually initialised
such that every possible key exists and is mapped to a value whose
byte-representation is all zeros, a type's :ref:`default value <default-value>`. The similarity ends there, the key data is not stored in a
mapping, only its ``keccak256`` hash is used to look up the value.

Because of this, mappings do not have a length or a concept of a key or
value being set.

Mappings can only have a data location of ``storage`` and thus
are allowed for state variables, as storage reference types
in functions, or as parameters for library functions.
They cannot be used as parameters or return parameters
of contract functions that are publicly visible.

You can mark state variables of mapping type as ``public`` and Solidity creates a
:ref:`getter <visibility-and-getters>` for you. The ``_KeyType`` becomes a parameter for the getter.
If ``_ValueType`` is a value type or a struct, the getter returns ``_ValueType``.
If ``_ValueType`` is an array or a mapping, the getter has one parameter for
each ``_KeyType``, recursively.

In the example below, the ``MappingExample`` contract defines a public ``balances``
mapping, with the key type an ``address``, and a value type a ``uint``, mapping
an unsigned integer value to an Ethereum address. As ``uint`` is a value type, the getter
returns a value that matches the type, which you can see in the ``MappingUser``
contract that returns the value at the specified address.

::

    pragma solidity >=0.4.0 <0.7.0;

    contract MappingExample {
        mapping(address => uint) public balances;

        function update(uint newBalance) public {
            balances[msg.sender] = newBalance;
        }
    }

    contract MappingUser {
        function f() public returns (uint) {
            MappingExample m = new MappingExample();
            m.update(100);
            return m.balances(address(this));
        }
    }

The example below uses a mapping type inside another mapping type. The important
point to remember are that the mapping inside the mapping is not the return value,
but the ``bool`` inside it is.

::

    pragma solidity >=0.4.0 <0.7.0;

    contract MappingExample {
        mapping(address => mapping(address => bool)) public validBalances;

        function transfer(address sender, address recipient) view public {
            require(validBalances[sender][recipient]);
        }

        function allowTransfers(address recipient) public {
            validBalances[msg.sender][recipient] = true;
        }

    }

    contract MappingUser {
        function f() public returns (bool) {
            MappingExample m = new MappingExample();
            m.transfer(address(this), msg.sender);
            return m.validBalances(address(this));
        }
    }

.. note::
  Mappings are not iterable, but it is possible to implement a data structure
  on top of them. For an example, see `iterable mapping <https://github.com/ethereum/dapp-bin/blob/master/library/iterable_mapping.sol>`_.
