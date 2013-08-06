From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Tue, 06 Aug 2013 13:40:07 +0000
Message-ID: <bug-56615-8800-h0Frr73Ak3@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0118642975=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0118642975==
Content-Type: multipart/alternative; boundary="1375796407.72B61A21.12159"; charset="us-ascii"


--1375796407.72B61A21.12159
Date: Tue, 6 Aug 2013 13:40:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #18 from Mark Cave-Ayland <mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org> ---
Hi Ilia,

I've just done a build and test against 3.11-rc3+ from nouveau/linux-2.6 git
master which shows as the following commit:

commit 68ea5eed7ca275434468edff36b3b49e5f129213
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Tue Jul 30 11:47:47 2013 +1000

    drm/nouveau/vm: make vm refcount into a kref

The result in terms of the hang are the same as before. Unfortunately I haven't
had a chance to do the network test yet whilst in the hung state since my
desktop switch is currently broken. If after reviewing the logs you still want
me to try this, let me know and I'll try to work something out.

The nouveau module was given the parameter debug=PGRAPH=debug and I did two
attempts: the first file 3.11-rc3-dmesg.plugged is a boot with the DP connector
plugged in (bad, hangs) whilst the second file 3.11-rc3-dmesg.unplug is a boot
without the DP connector plugged in (good, but standalone mode only).

I see there are some mentions of switcheroo in the logs which is interesting
given that I'm currently running it in Discrete Graphics (nVidia mode) without
Optimus enabled in the BIOS.


Many thanks,

Mark.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375796407.72B61A21.12159
Date: Tue, 6 Aug 2013 13:40:07 +0000
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
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:mark.cave-ayland&#64;ilande.co.uk" title="Mark Cave-Ayland &lt;mark.cave-ayland&#64;ilande.co.uk&gt;"> <span class="fn">Mark Cave-Ayland</span></a>
</span></b>
        <pre>Hi Ilia,

I've just done a build and test against 3.11-rc3+ from nouveau/linux-2.6 git
master which shows as the following commit:

commit 68ea5eed7ca275434468edff36b3b49e5f129213
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Tue Jul 30 11:47:47 2013 +1000

    drm/nouveau/vm: make vm refcount into a kref

The result in terms of the hang are the same as before. Unfortunately I haven't
had a chance to do the network test yet whilst in the hung state since my
desktop switch is currently broken. If after reviewing the logs you still want
me to try this, let me know and I'll try to work something out.

The nouveau module was given the parameter debug=PGRAPH=debug and I did two
attempts: the first file 3.11-rc3-dmesg.plugged is a boot with the DP connector
plugged in (bad, hangs) whilst the second file 3.11-rc3-dmesg.unplug is a boot
without the DP connector plugged in (good, but standalone mode only).

I see there are some mentions of switcheroo in the logs which is interesting
given that I'm currently running it in Discrete Graphics (nVidia mode) without
Optimus enabled in the BIOS.


Many thanks,

Mark.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375796407.72B61A21.12159--

--===============0118642975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0118642975==--
