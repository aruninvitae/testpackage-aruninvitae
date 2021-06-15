import pytest
from testpackage.foo import FooClass, foo_func


@pytest.mark.parametrize("name", ["foo", "bar"])
def test_foo_class(name):
    obj = FooClass(name)
    assert obj.name == name

@pytest.mark.parametrize("a", [-1, 0, 1])
def test_foo_func(a):
    result = foo_func(a)
    assert result == a + 1
