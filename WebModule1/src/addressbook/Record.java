package addressbook;

public class Record {
	protected int id;
    protected String user;
	protected String name;
	protected int phone;
	protected String address;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser () {
		return (user);
	}
	
	public String getName (){
		return (name);
	}      
	
	public int getPhone () {
		return (phone);
	}            
	
	public String getAddress () {
		return (address);
    }                  
	
	public void setUser (String newUser)
	{
		user = newUser;
	}
	
	public void setName (String newName)
	{
		name = newName;
	}
	 
	public void setPhone (int newPhone)
	{
		phone = newPhone;
	}
	public void setAddress (String newAddress)
	{
		address = newAddress;
	}      
}