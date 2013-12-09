From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Mon, 09 Dec 2013 11:04:50 +0000
Message-ID: <bug-58556-8800-8IClecjoRk@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1794386093=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============1794386093==
Content-Type: multipart/alternative; boundary="1386587090.8c1EDf3.8886"; charset="us-ascii"


--1386587090.8c1EDf3.8886
Date: Mon, 9 Dec 2013 11:04:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #21 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Necessary part from nouveau_channel_new to get a clean screan are:
- nouveau_channel_ind
- nouveau_channel_init, but only the beginning:
  - vram creation
  - gart creation
  - dma variables initialisation

There are some MEM_CACHE errors, but at least it boosts and screen is clean.

I found out that nouveau_abi16_ioctl_channel_alloc was also calling
nouveau_channel_new, but with other arguments for vram and gart, and it is
called whether or not acceleration is enabled.
Is there a specific reason to call at first nouveau_channel_new only when
acceleration is enabled, and later on when starting the GUI, to always call it?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386587090.8c1EDf3.8886
Date: Mon, 9 Dec 2013 11:04:50 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Necessary part from nouveau_channel_new to get a clean screan are:
- nouveau_channel_ind
- nouveau_channel_init, but only the beginning:
  - vram creation
  - gart creation
  - dma variables initialisation

There are some MEM_CACHE errors, but at least it boosts and screen is clean.

I found out that nouveau_abi16_ioctl_channel_alloc was also calling
nouveau_channel_new, but with other arguments for vram and gart, and it is
called whether or not acceleration is enabled.
Is there a specific reason to call at first nouveau_channel_new only when
acceleration is enabled, and later on when starting the GUI, to always call it?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386587090.8c1EDf3.8886--

--===============1794386093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1794386093==--
