namespace MedicalLabScheduler.Core.CommonModels.Data
{
    public interface IEntity<TPrimaryKey>
    {
        TPrimaryKey Id { get; set; }
    }
}
