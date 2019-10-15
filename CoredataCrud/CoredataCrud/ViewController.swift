
import UIKit
import CoreData

class ViewController: UIViewController {

    let managedContext = CoreDataManager.shared.persistentContainer.viewContext
    var name:String  = ""
    var email:String = ""
    var pass:String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func createCoreData(){
    guard let userEntity = NSEntityDescription.entity(forEntityName:"User",in:managedContext) else {return}
        
        for i in 1...5{
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue("Raman\(i)", forKey: "username")
            user.setValue("Raman\(i)@gmail.com", forKey: "email")
            user.setValue("Raman@\(i)", forKey: "password")
        }
        
        do{
            try managedContext.save()
            
        }catch let error as NSError{
            
           print(error.localizedDescription)
            
        }
    }
    
    func retrieveData(){
        
        guard NSEntityDescription.entity(forEntityName:"User",in:managedContext) != nil else {return}

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        do{
           let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                name  = data.value(forKey: "username") as! String
                email = data.value(forKey: "email") as! String
                pass  = data.value(forKey: "password") as! String
                print("\(name) \(email) \(pass)")
                print(result.count)
            }
        }catch{
            print("failed")
        }
        
    }
    
    func updateData(){
     //   guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
 
        guard NSEntityDescription.entity(forEntityName:"User",in:managedContext) != nil else {return}
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "Raman1")
        
        do{
            let test = try managedContext.fetch(fetchRequest)
            let objectupdate = test as! NSManagedObject
            objectupdate.setValue("Aman", forKey: "username")
            objectupdate.setValue("Aman@fjhj.com", forKey: "email")
            objectupdate.setValue("Aman@33", forKey: "password")
            
            do{
                try managedContext.save()
            }catch{
                print("Save failed")
                  }
             }catch{
            print("falied")
        }
    }
    
    func deleteDate(){
    
        guard NSEntityDescription.entity(forEntityName:"User",in:managedContext) != nil else {return}
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
            fetchRequest.predicate = NSPredicate(format: "username = %@", "Raman3")
        do{
            let test = try managedContext.fetch(fetchRequest)
            if !test.isEmpty{
            let ojectDelete = test as! [NSManagedObject]
                for i in ojectDelete{
                    managedContext.delete(i)
                }
//                ojectDelete.forEach { (item) in
//                    managedContext.delete(item)
//                }
                print(" Item delete at 0th index ")
            }else{
                print(" Could not delete becase no item to delete ")
            }
            
            do{
                try managedContext.save()
            }
            catch{
                print("Save failed")
            }
        }
        catch{
            print("Failed")
        }
    }
    
    @IBAction func create(_ sender: Any) {
        
        createCoreData()
        
    }
   
    @IBAction func Retrieve(_ sender: Any) {
        
        retrieveData()
        
    }
    
    @IBAction func updateTapped(_ sender: Any) {
        
        updateData()
        
    }
    
    @IBAction func Delete(_ sender: Any) {
        
        deleteDate()
        
    }

}

