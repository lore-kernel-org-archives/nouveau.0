From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58615] nv43 hangs with direct rendering since 3.7
	rework
Date: Fri, 21 Dec 2012 12:28:47 +0000
Message-ID: <bug-58615-8800-aPMFsOVH56@http.bugs.freedesktop.org/>
References: <bug-58615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0870277131=="
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


--===============0870277131==
Content-Type: multipart/alternative; boundary="1356092927.Eb73Abd1.13898"; charset="us-ascii"


--1356092927.Eb73Abd1.13898
Date: Fri, 21 Dec 2012 12:28:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58615

--- Comment #3 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Created attachment 71922
  --> https://bugs.freedesktop.org/attachment.cgi?id=71922&action=edit
Kernel .config

This is  my  minimal  kernel  config -  but  bug  also  happens  with  bigger 
one (SMP, SLUB, tons  of  modules, etc). What  I  haven't  checked  - if 
changing ARCH  from i486 to something  more  modern will do  any  good -  will
try this, too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356092927.Eb73Abd1.13898
Date: Fri, 21 Dec 2012 12:28:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv43 hangs with direct rendering since 3.7 rework"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615">bug 58615</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=71922" name="attach_71922" title="Kernel .config">attachment 71922</a> <a href="attachment.cgi?id=71922&amp;action=edit" title="Kernel .config">[details]</a></span>
Kernel .config

This is  my  minimal  kernel  config -  but  bug  also  happens  with  bigger 
one (SMP, SLUB, tons  of  modules, etc). What  I  haven't  checked  - if 
changing ARCH  from i486 to something  more  modern will do  any  good -  will
try this, too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356092927.Eb73Abd1.13898--

--===============0870277131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0870277131==--
