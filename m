From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28763] Kernel Oops when displaying a large image
Date: Sun,  4 Jul 2010 09:16:18 -0700 (PDT)
Message-ID: <20100704161618.22D551300A7@annarchy.freedesktop.org>
References: <bug-28763-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28763-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=28763

--- Comment #11 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-07-04 09:16:17 PDT ---
So it's swap_storage->f_path.dentry->d_inode == NULL

I can't find how is this possible...
shmem_file_setup initializes d_inode correctly or returns an error.
persistant_swap_storage seems to be allocated the same way
(nouveau_gem_new->drm_gem_object_alloc->drm_gem_object_init->shmem_file_setup).

So something had to set d_inode to NULL on persistant_swap_storage between
nouveau_gem_new and ttm_tt_swapout...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
