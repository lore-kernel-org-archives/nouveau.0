From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58615] nv43 hangs with direct rendering since 3.7
	rework
Date: Fri, 15 Feb 2013 05:47:27 +0000
Message-ID: <bug-58615-8800-9Iv9WgMmUC@http.bugs.freedesktop.org/>
References: <bug-58615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1344225681=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1344225681==
Content-Type: multipart/alternative; boundary="1360907247.CE7421.15416"; charset="us-ascii"


--1360907247.CE7421.15416
Date: Fri, 15 Feb 2013 05:47:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58615

--- Comment #8 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Created attachment 74851
  --> https://bugs.freedesktop.org/attachment.cgi?id=74851&action=edit
Kernel  config [working  glxgears with  direct  rendering]

Kernel  was  from  nouveau  tree  at  commit 

commit f253235ed48aca9ebf008952d8484e59e64bebae
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Feb 14 13:43:21 2013 +1000

    drm/nv84-/fence: prepare for emit/sync support of sysram sequences
---------------

Sadly,  launching  seamonkey  caused  GPU  lockup,  still. But  I  was able  to
 switch  back  to console  and  reboot. But  it was  different  bug,  this  one
 doesn't  show  any  'GPU  lockup'  messages.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360907247.CE7421.15416
Date: Fri, 15 Feb 2013 05:47:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv43 hangs with direct rendering since 3.7 rework"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv43 hangs with direct rendering since 3.7 rework"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615">bug 58615</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=74851" name="attach_74851" title="Kernel  config [working  glxgears with  direct  rendering]">attachment 74851</a> <a href="attachment.cgi?id=74851&amp;action=edit" title="Kernel  config [working  glxgears with  direct  rendering]">[details]</a></span>
Kernel  config [working  glxgears with  direct  rendering]

Kernel  was  from  nouveau  tree  at  commit 

commit f253235ed48aca9ebf008952d8484e59e64bebae
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Thu Feb 14 13:43:21 2013 +1000

    drm/nv84-/fence: prepare for emit/sync support of sysram sequences
---------------

Sadly,  launching  seamonkey  caused  GPU  lockup,  still. But  I  was able  to
 switch  back  to console  and  reboot. But  it was  different  bug,  this  one
 doesn't  show  any  'GPU  lockup'  messages.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360907247.CE7421.15416--

--===============1344225681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1344225681==--
