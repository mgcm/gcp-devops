# Google Cloud DevOps

This is a bunch of helpful scripts to manage Google Cloud development operations.

## Scripts

- **cleanup.sh:** iterates thru all active account projects, gets their snapshots and deletes all snapshots older than 30 days.

 - **snapshots.sh:** iterates thru all the active account projects, gets their disks and respective regions, and triggers an async snapshot of each and every disk.


## Author

Milton Moura @ <miltonmoura@gmail.com>

## License

This repository is available under the MIT license. See the LICENSE file for more info.
