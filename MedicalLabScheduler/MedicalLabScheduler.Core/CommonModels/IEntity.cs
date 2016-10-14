namespace MedicalLabScheduler.Core.CommonModels
{
    public interface IEntity<TPrimaryKey>
    {
        TPrimaryKey Id { get; set; }
    }
}
