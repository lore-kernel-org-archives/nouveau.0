From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64746] optimus don't use nouveau card
Date: Fri, 30 Aug 2013 13:03:38 +0000
Message-ID: <bug-64746-8800-2VYg2nn2hP@http.bugs.freedesktop.org/>
References: <bug-64746-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1937073394=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64746-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1937073394==
Content-Type: multipart/alternative; boundary="1377867818.bc3ddF00.15925"; charset="us-ascii"


--1377867818.bc3ddF00.15925
Date: Fri, 30 Aug 2013 13:03:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64746

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hmm something unusual is happening here

* the var/messages does not indicate any writes to vgaswitcheroo/switch
* the Xorg.log still indicates that the intel card is setup and used as primary

So to get a better picture (including timeline) can you do the following

1. Toggle/switch to the nv card
$ cat /sys/kernel/debug/vgaswitcheroo/switch 
$ echo "0000:01:00.0" /sys/kernel/debug/vgaswitcheroo/switch

2. Confirm that the nv card is used (paste the output in your reply)
$ cat /sys/kernel/debug/vgaswitcheroo/switch 

3. Start X
$ init 5 #startx # systemd start {g,k,x}dm

and then attach the output of the following (plain text, please)

* dmesg
* Xorg.0.log
* LIBGL_DEBUG=verbose glxinfo
* LIBGL_DEBUG=verbose DRI_PRIME=1 glxinfo

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377867818.bc3ddF00.15925
Date: Fri, 30 Aug 2013 13:03:38 +0000
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
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746">bug 64746</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hmm something unusual is happening here

* the var/messages does not indicate any writes to vgaswitcheroo/switch
* the Xorg.log still indicates that the intel card is setup and used as primary

So to get a better picture (including timeline) can you do the following

1. Toggle/switch to the nv card
$ cat /sys/kernel/debug/vgaswitcheroo/switch 
$ echo &quot;0000:01:00.0&quot; /sys/kernel/debug/vgaswitcheroo/switch

2. Confirm that the nv card is used (paste the output in your reply)
$ cat /sys/kernel/debug/vgaswitcheroo/switch 

3. Start X
$ init 5 #startx # systemd start {g,k,x}dm

and then attach the output of the following (plain text, please)

* dmesg
* Xorg.0.log
* LIBGL_DEBUG=verbose glxinfo
* LIBGL_DEBUG=verbose DRI_PRIME=1 glxinfo

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377867818.bc3ddF00.15925--

--===============1937073394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1937073394==--
