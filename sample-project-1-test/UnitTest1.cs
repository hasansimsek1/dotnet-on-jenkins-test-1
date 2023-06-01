using Xunit;
using sample_project_1;

namespace sample_project_1_test;

public class UnitTest1
{
    [Fact]
    public void Test1()
    {
        WeatherForecast wf = new();
        var testResult = wf.TestMe();
        Assert.Equal(1, testResult);
    }
}