/* Neon project config for VMS.
   Postgres is provided by the linked Neon branch, and Object Storage is
   configured via the project’s bucket settings. Keep the values empty until
   the project is linked or the service credentials are available. */
window.VMS_CONFIG = window.VMS_CONFIG || {
  neonDatabaseUrl: '',
  neonApiUrl: 'http://localhost:3001/api/vms',
  neonObjectStorageUrl: 'https://br-shy-water-b4h12y83.storage.c-6.us-east-2.aws.neon.tech',
  neonObjectStorageBucket: 'media',
  neonOrgId: 'org-fancy-recipe-24292606',
  neonProjectId: 'flat-feather-94166975',
  neonBranchId: 'br-shy-water-b4h12y83',
  adminEmail: 'fahuervodelacruz@hotmail.com',
};
