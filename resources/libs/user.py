from faker import Faker

fake = Faker('pt_BR')

def generate_name():
    return fake.name()

def generate_email():
    return fake.email()