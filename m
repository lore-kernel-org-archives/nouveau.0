From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12300] DMA queue hang (Quadro FX 4500)
Date: Fri,  7 Sep 2007 06:11:12 -0700 (PDT)
Message-ID: <20070907131112.7D38A13005E@annarchy.freedesktop.org>
References: <bug-12300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-12300-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12300


dmitry.platonov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #11448|0                           |1
        is obsolete|                            |




------- Comment #6 from dmitry.platonov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-09-07 06:11 PST -------
Created an attachment (id=11463)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=11463&action=view)
DRM output after patching DRM & switching to master

Build Date: 06 September 2007
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Fri Sep  7 16:46:01 2007
(++) Using config file: "/etc/X11/xorg.conf.nouveau"
(II) Module already built-in
(II) Module already built-in
(II) Module already built-in
DISPATCH ERROR! _glapi_add_dispatch failed to add glGetVertexAttribPointerv!
DISPATCH ERROR! _glapi_add_dispatch failed to add glVertexAttrib4iv!
DISPATCH ERROR! _glapi_add_dispatch failed to add glVertexAttrib4bv!
DISPATCH ERROR! _glapi_add_dispatch failed to add glVertexAttrib4ubv!
DISPATCH ERROR! _glapi_add_dispatch failed to add glVertexAttrib4usv!
DISPATCH ERROR! _glapi_add_dispatch failed to add glGetVertexAttribPointerv!
DISPATCH ERROR! _glapi_add_dispatch failed to add glVertexAttrib4uiv!

Fatal server error:
DMA queue hang: dmaPut=1ffc, current=0, status=0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
