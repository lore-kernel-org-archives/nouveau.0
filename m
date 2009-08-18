From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23382] Nouveau DRM module out-of-tree compile errors
Date: Tue, 18 Aug 2009 00:36:04 -0700 (PDT)
Message-ID: <20090818073604.D4F0513005A@annarchy.freedesktop.org>
References: <bug-23382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23382





--- Comment #1 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-08-18 00:36:02 PST ---
(In reply to comment #0)
> Created an attachment (id=28717)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=28717) [details]
> Patch to fix drm_encoder_slave.h includes.

The equivalent patch is already present in the master-compat branch
(commit 1b527aded95176a2bc4b19f0191f9e6d412ad413), and has been sent to DRM
upstream. It will come to master branch in time, in the mean time you can
use master-compat.

> When doing an out-of-tree compile on the nouveau kernel module, recent GIT
> versions fail to compile without patching for a couple reasons.  The first can
> be fixed with the attached patch.

master-compat has always worked for me (since I try to remember to check and
fix it before pushing).

> The second has to do with the fact that drivers/gpu/drm/nouveau/nouveau_drv.h
> declares the prototype for nouveau_encoder_connector_get, which relies on the
> type `struct nouveau_encoder*', defined in
> drivers/gpu/drm/nouveau/nouveau_encoder.h.  However, nouveau_encoder.h needs
> nouveau_drv.h for the type `struct nv04_output_reg'.  This circular dependency
> causes compilation of nouveau_drv.c to fail.

I've never seen this problem. In what I see, the prototype for
nouveau_encoder_connector_get() is in nouveau_encoder.h. Okay, it has already
been fixed in commit 8745851d364bc175d06d4de3cfa47cd65c399a04.

> Also, any reason the include guard for nouveau_encoder.h is called
> __NOUVEAU_OUTPUT_H__?

Indeed, I'll fix that.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
