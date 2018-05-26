# ios-kh-contact
UITableView

UITableView is used to display List of data , think of it as the listView in android
We can customize the Cell in UITableView by just drag and drop the component in the interface builder of Xcode

and of course we need to wire up from the interfacebuilder to the code ,
to wireup bring the assistant editor from the the CELL to UITableViewCell and wire every component

We need UITableViewController to control the behavior of the table like the row height, the selected row the segue when row is clicked , the data that need to load in the row

there are 3 vital function in UITableViewController we need to look at ,  

//Mark : for the data to load at each cell
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! MyTableViewCell

        cell.name.text = elements[indexPath.row]
        return cell
    }

//Mark : the function to specify how many section in the table
override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

//Mark : to return the total rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("\(elements.count)")
        return elements.count
    }
