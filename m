From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13864] crash on server restart
Date: Thu, 23 Oct 2008 08:33:51 -0700 (PDT)
Message-ID: <20081023153417.4519413006B@annarchy.freedesktop.org>
References: <bug-13864-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13864-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=13864





--- Comment #20 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-10-23 08:33:35 PST ---
Using the repro method in comment 19, I've pushed some stuff which now lets me
regenerate without crashing, so anyone who was hitting this, please test.

The problem here is that for every mmap(2) (wrapped in the libdrm function
drmMap), the kernel increases the refcount on the struct file associated with
the drm file descriptor.  While we can happily call drmClose (which wraps
close(2)), this only decreases the filp->f_count refcount by one, and the count
needs to hit zero before the fops->release function (drm_release) is called to
free all kernel-side resources.
Calling the release function also means that next time the DRM is opened the
opener becomes DRM master, which is necessary for privileged ioctls to work on
the next xserver generation.  The solution pushed is to drmUnmap (wrapping
munmap(2)) all mappings made on the fd (i.e. the user channel, and all buffer
objects).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
