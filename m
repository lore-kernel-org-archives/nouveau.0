From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92274] nouveau black screen and errors with two
 monitors attached
Date: Mon, 05 Oct 2015 20:06:04 +0000
Message-ID: <bug-92274-8800-dbTczKswL7@http.bugs.freedesktop.org/>
References: <bug-92274-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1528351846=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92274-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1528351846==
Content-Type: multipart/alternative; boundary="1444075564.C1EB02.12786"; charset="UTF-8"


--1444075564.C1EB02.12786
Date: Mon, 5 Oct 2015 20:06:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92274

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to joseph-thommes from comment #10)
> Ok I'm sorry to ask again, but I've got no idea what the methods nvkm_mask,
> read, and wr32 are expecting, returning or doing, so I cannot
> think by myself what to do...
> (By the way in my sources they are just named nv_*.)
> So where can I find documentation about it or where are they defined?
> I'm familiar with (userspace) C, but not in these dimensions
> and I don't know how to locate the definition of a function except for
> looking in all included headers recursively...
> Did I understand you correctly, that I should make the changes like this:
> (again I've got no idea what these functions do, so it might be nonsense)
> 
> /* AVI InfoFrame */
> 
>         u32 foo = nvkm_rd32(device, 0x690000 + hdmi);
>         nvkm_wr32(device, 0x690000 + hdmi, foo & ~1);
>         nvkm_wr32(device, 0x69000c + hdmi, 0x0000006f);
>         nvkm_wr32(device, 0x690010 + hdmi, 0x00000000);
>         nvkm_wr32(device, 0x690014 + hdmi, 0x00000000);
>         nvkm_wr32(device, 0x690018 + hdmi, 0x00000000);
>         nvkm_wr32(device, 0x690000 + hdmi, foo | 1);
> 
>         /* ??? InfoFrame? */
>         u32 foo = nvkm_rd32(device, 0x6900c0 + hdmi);        
>         nvkm_wr32(device, 0x6900c0 + hdmi, foo & ~1);
>         nvkm_wr32(device, 0x6900cc + hdmi, 0x00000010);
>         nvkm_wr32(device, 0x6900c0 + hdmi, foo | 1);

Seems right to me, except of course it won't compile since you have two
variables named "foo" being declared in the same scope. Remove the second 'u32'
and you should be good to go.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444075564.C1EB02.12786
Date: Mon, 5 Oct 2015 20:06:04 +0000
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
   title="NEW - nouveau black screen and errors with two monitors attached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92274#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau black screen and errors with two monitors attached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92274">bug 92274</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to joseph-thommes from <a href="show_bug.cgi?id=92274#c10">comment #10</a>)
<span class="quote">&gt; Ok I'm sorry to ask again, but I've got no idea what the methods nvkm_mask,
&gt; read, and wr32 are expecting, returning or doing, so I cannot
&gt; think by myself what to do...
&gt; (By the way in my sources they are just named nv_*.)
&gt; So where can I find documentation about it or where are they defined?
&gt; I'm familiar with (userspace) C, but not in these dimensions
&gt; and I don't know how to locate the definition of a function except for
&gt; looking in all included headers recursively...
&gt; Did I understand you correctly, that I should make the changes like this:
&gt; (again I've got no idea what these functions do, so it might be nonsense)
&gt; 
&gt; /* AVI InfoFrame */
&gt; 
&gt;         u32 foo = nvkm_rd32(device, 0x690000 + hdmi);
&gt;         nvkm_wr32(device, 0x690000 + hdmi, foo &amp; ~1);
&gt;         nvkm_wr32(device, 0x69000c + hdmi, 0x0000006f);
&gt;         nvkm_wr32(device, 0x690010 + hdmi, 0x00000000);
&gt;         nvkm_wr32(device, 0x690014 + hdmi, 0x00000000);
&gt;         nvkm_wr32(device, 0x690018 + hdmi, 0x00000000);
&gt;         nvkm_wr32(device, 0x690000 + hdmi, foo | 1);
&gt; 
&gt;         /* ??? InfoFrame? */
&gt;         u32 foo = nvkm_rd32(device, 0x6900c0 + hdmi);        
&gt;         nvkm_wr32(device, 0x6900c0 + hdmi, foo &amp; ~1);
&gt;         nvkm_wr32(device, 0x6900cc + hdmi, 0x00000010);
&gt;         nvkm_wr32(device, 0x6900c0 + hdmi, foo | 1);</span >

Seems right to me, except of course it won't compile since you have two
variables named &quot;foo&quot; being declared in the same scope. Remove the second 'u32'
and you should be good to go.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444075564.C1EB02.12786--

--===============1528351846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1528351846==--
