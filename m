From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94757] powerpc64 & 64Kb kernel pagesize not working
 with nouveau
Date: Wed, 30 Mar 2016 09:33:27 +0000
Message-ID: <bug-94757-8800-DJaNT5pBNT@http.bugs.freedesktop.org/>
References: <bug-94757-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1476800567=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94757-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1476800567==
Content-Type: multipart/alternative; boundary="14593304071.d451.12520";
 charset="UTF-8"


--14593304071.d451.12520
Date: Wed, 30 Mar 2016 09:33:27 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94757

--- Comment #2 from Mathieu Malaterre <mathieu.malaterre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As explained here:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=790694#27

[...]
I saw that bug report as well.  I'm not sure what to do about it -
other distributions were also using 64K pages for 64-bit PowerPC the
last time I looked, and there may be good reasons to do that.
[...]

So it would make sense to make nouveau capable of handling 64K pages for
64-bits PowerPC.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14593304071.d451.12520
Date: Wed, 30 Mar 2016 09:33:27 +0000
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
   title="NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94757#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94757">bug 94757</a>
              from <span class="vcard"><a class="email" href="mailto:mathieu.malaterre&#64;gmail.com" title="Mathieu Malaterre &lt;mathieu.malaterre&#64;gmail.com&gt;"> <span class="fn">Mathieu Malaterre</span></a>
</span></b>
        <pre>As explained here:

<a href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=790694#27">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=790694#27</a>

[...]
I saw that bug report as well.  I'm not sure what to do about it -
other distributions were also using 64K pages for 64-bit PowerPC the
last time I looked, and there may be good reasons to do that.
[...]

So it would make sense to make nouveau capable of handling 64K pages for
64-bits PowerPC.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14593304071.d451.12520--

--===============1476800567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1476800567==--
