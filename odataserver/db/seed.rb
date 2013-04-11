10.times {|n| ODataServerTest.create(name:"Test#{n}") }
#mongo model
10.times {|n| MongoidTest.create(name:"Test#{n}") }
