From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28M)
Date: Wed, 27 Jan 2016 07:24:46 +0000
Message-ID: <bug-54700-8800-VYEvHbFkOw@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1853082147=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1853082147==
Content-Type: multipart/alternative; boundary="14538794851.cfbc0.24662";
 charset="UTF-8"


--14538794851.cfbc0.24662
Date: Wed, 27 Jan 2016 07:24:45 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #79 from AndrewK <kurn-z1KUqvL5UUQ@public.gmane.org> ---
(In reply to Emil Velikov from comment #77)
> agpmode and modeset are not even remotely related I'm afraid. With 4.3
> onward one should be using nouveau.config="NvAGP=0" as documented [1]
> 
> [1] http://nouveau.freedesktop.org/wiki/KernelModuleParameters/#config

Yes.  The syntax given seems to do the trick.  Thanks much.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14538794851.cfbc0.24662
Date: Wed, 27 Jan 2016 07:24:45 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c79">Comment # 79</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:kurn&#64;sfu.ca" title="AndrewK &lt;kurn&#64;sfu.ca&gt;"> <span class="fn">AndrewK</span></a>
</span></b>
        <pre>(In reply to Emil Velikov from <a href="show_bug.cgi?id=54700#c77">comment #77</a>)
<span class="quote">&gt; agpmode and modeset are not even remotely related I'm afraid. With 4.3
&gt; onward one should be using nouveau.config=&quot;NvAGP=0&quot; as documented [1]
&gt; 
&gt; [1] <a href="http://nouveau.freedesktop.org/wiki/KernelModuleParameters/#config">http://nouveau.freedesktop.org/wiki/KernelModuleParameters/#config</a></span >

Yes.  The syntax given seems to do the trick.  Thanks much.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14538794851.cfbc0.24662--

--===============1853082147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1853082147==--
