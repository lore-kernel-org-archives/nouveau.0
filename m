From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86641] [NVAC] nouveau crashes kernel with nvidia
	9400 igp
Date: Mon, 24 Nov 2014 07:47:14 +0000
Message-ID: <bug-86641-8800-sHox18ig9y@http.bugs.freedesktop.org/>
References: <bug-86641-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0825318633=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86641-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0825318633==
Content-Type: multipart/alternative; boundary="1416815234.6A2Dd2.18728"; charset="UTF-8"


--1416815234.6A2Dd2.18728
Date: Mon, 24 Nov 2014 07:47:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86641

--- Comment #4 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> From IRC:
> 
> <mirak> ./nvapeek 0x100c14
> <mirak> 00100c14: 00010003
> 
> So it's a very different issue than the sort of thing that the macbooks were
> experiencing.

It seems so. Init'ing the NVAC on the MBPs failed with interrupt 0x00400000
iirc, whereas this one passes the initialisation without troubles, but fails
when loading X.

@mirak
I would be interested by a mmio trace from the Nvidia driver (see
https://wiki.ubuntu.com/X/MMIOTracing), to compare it with mine and see what's
going differently.
You mentioned issues with the Nvidia driver, what kind of issues are you
experiencing? (If it fails the same way, there won't be much we can do...
Probably just poking the Nvidia guys about it.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416815234.6A2Dd2.18728
Date: Mon, 24 Nov 2014 07:47:14 +0000
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
   title="NEW - [NVAC] nouveau crashes kernel with nvidia 9400 igp"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86641#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] nouveau crashes kernel with nvidia 9400 igp"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86641">bug 86641</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=86641#c1">comment #1</a>)
<span class="quote">&gt; From IRC:
&gt; 
&gt; &lt;mirak&gt; ./nvapeek 0x100c14
&gt; &lt;mirak&gt; 00100c14: 00010003
&gt; 
&gt; So it's a very different issue than the sort of thing that the macbooks were
&gt; experiencing.</span >

It seems so. Init'ing the NVAC on the MBPs failed with interrupt 0x00400000
iirc, whereas this one passes the initialisation without troubles, but fails
when loading X.

&#64;mirak
I would be interested by a mmio trace from the Nvidia driver (see
<a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a>), to compare it with mine and see what's
going differently.
You mentioned issues with the Nvidia driver, what kind of issues are you
experiencing? (If it fails the same way, there won't be much we can do...
Probably just poking the Nvidia guys about it.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416815234.6A2Dd2.18728--

--===============0825318633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0825318633==--
