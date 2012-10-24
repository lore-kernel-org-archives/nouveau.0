From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51409] [NV05] when ubuntu tests the gnome
 environment the nouveau_vieux_dri (ver) segfaults
Date: Wed, 24 Oct 2012 04:07:54 +0000
Message-ID: <bug-51409-8800-OfQeqIZiLI@http.bugs.freedesktop.org/>
References: <bug-51409-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0153086151=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51409-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0153086151==
Content-Type: multipart/alternative; boundary="1351051674.1d7e2.11707"; charset="us-ascii"


--1351051674.1d7e2.11707
Date: Wed, 24 Oct 2012 04:07:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51409

--- Comment #1 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
Hi,

I assume you are using an NVIDIA RIVA TNT2-based graphics card (NV5).
I have observed somewhat similar instability of RIVA TNT2 M64 with VIA
Technologies Apollo MVP3 chipset.
Of all the graphics chips I have tested, RIVA TNT2 M64 is by far the worst in
terms of system stability on an Apollo MVP3 chipset-based mainboard.
I have tested this Apollo MVP3 chipset-based mainboard against various NVIDIA,
ATI Technologies, and SiS graphics chips.
In case of NVIDIA, their new stuff (i.e., GeForce 2 MX, GeForce 4 MX, and
GeForce FX) work much better than RIVA TNT2 M64.
Strange problem since RIVA TNT2 M64 works fine on many other AGP-based
mainboards I have.
I assume it is some kind of VIA Technologies specific device driver bug that
manifests itself when mated with RIVA TNT2.
Refer to this report I have submitted.

https://bugs.launchpad.net/ubuntu/+source/xorg/+bug/1065300

I will be filing a bug report regarding this issue with freedesktop.org soon.

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351051674.1d7e2.11707
Date: Wed, 24 Oct 2012 04:07:54 +0000
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
   title="NEW --- - [NV05] when ubuntu tests the gnome environment the nouveau_vieux_dri (ver) segfaults"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51409#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV05] when ubuntu tests the gnome environment the nouveau_vieux_dri (ver) segfaults"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51409">bug 51409</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>Hi,

I assume you are using an NVIDIA RIVA TNT2-based graphics card (NV5).
I have observed somewhat similar instability of RIVA TNT2 M64 with VIA
Technologies Apollo MVP3 chipset.
Of all the graphics chips I have tested, RIVA TNT2 M64 is by far the worst in
terms of system stability on an Apollo MVP3 chipset-based mainboard.
I have tested this Apollo MVP3 chipset-based mainboard against various NVIDIA,
ATI Technologies, and SiS graphics chips.
In case of NVIDIA, their new stuff (i.e., GeForce 2 MX, GeForce 4 MX, and
GeForce FX) work much better than RIVA TNT2 M64.
Strange problem since RIVA TNT2 M64 works fine on many other AGP-based
mainboards I have.
I assume it is some kind of VIA Technologies specific device driver bug that
manifests itself when mated with RIVA TNT2.
Refer to this report I have submitted.

<a href="https://bugs.launchpad.net/ubuntu/+source/xorg/+bug/1065300">https://bugs.launchpad.net/ubuntu/+source/xorg/+bug/1065300</a>

I will be filing a bug report regarding this issue with freedesktop.org soon.

Regards,

fpgahardwareengineer</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351051674.1d7e2.11707--

--===============0153086151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0153086151==--
