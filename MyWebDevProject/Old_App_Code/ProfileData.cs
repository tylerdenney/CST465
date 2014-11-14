using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class ProfileData
{
    private string name;
    private string band;
    private string hobby;
    private string biography;
    private string courseprefix;
    private string coursenumber;
    private string coursedescription;
    private string usertype;

    public string Name
    {
        get { return name;}
        set { name = value;}
    }
    public string Band
    {
        get { return band; }
        set { band = value; }
    }
    public string Hobby
    {
        get { return hobby; }
        set { hobby = value; }
    }
    public string Bio
    {
        get { return biography; }
        set { biography = value; }
    }
    public string CoursePrefix
    {
        get { return courseprefix; }
        set { courseprefix = value; }
    }
    public string CourseNumber
    {
        get { return coursenumber; }
        set { coursenumber = value; }
    }
    public string CourseDesc
    {
        get { return coursedescription; }
        set { coursedescription = value; }
    }
    public string UserType
    {
        get { return usertype; }
        set { usertype = value; }
    }
	public ProfileData(string pusertype, string pname, string phobby, string pband, string pbio, string pcoursepre, string pcoursenum, string pcoursedesc )
	{
        usertype = pusertype;
        name = pname;
        hobby = phobby;
        band = pband;
        biography = pbio;
        courseprefix = pcoursepre;
        coursenumber = pcoursenum;
        coursedescription = pcoursedesc;
	}
}