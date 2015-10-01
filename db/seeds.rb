@mobiles = Department.create(name: 'Mobiles')
@laptops = Department.create(name: 'Laptops')
@acc = Department.create(name: 'Accessories')

Product.create(image: 'moto_x.png', title: 'Moto X', description: 'some description about the product', price: 16000.00, active: true, department_id: 1)
Product.create(image: 'moto_e.png', title: 'Moto E', description: 'some description about the product', price: 6000.00, active: true, department_id: 1)
Product.create(image: 'intex.png', title: 'Intex', description: 'some description about the product', price: 7000.00, active: true, department_id: 1)
Product.create(image: 'lenovo.png', title: 'Lenovo', description: 'some description about the product', price: 27000.00, active: true, department_id: 2)
Product.create(image: 'samsung_hs.png', title: 'Samsung Headset', description: 'some description about the product', price: 700.00, active: true, department_id: 3)