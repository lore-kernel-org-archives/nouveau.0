From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87361] [NV4C] GPU lock-up after booting to desktop
 in Fedora 20 & 21 (Nvidia Geforce 6100 IGP)
Date: Wed, 17 Dec 2014 08:01:52 +0000
Message-ID: <bug-87361-8800-4JBzusUc63@http.bugs.freedesktop.org/>
References: <bug-87361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0611130020=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0611130020==
Content-Type: multipart/alternative; boundary="1418803312.b5C460.19229"; charset="UTF-8"


--1418803312.b5C460.19229
Date: Wed, 17 Dec 2014 08:01:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87361

--- Comment #6 from Jan Jasper de Kroon <jajadekroon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
A quick search around the freedesktop.org bugzilla with search criteria NV4C
revealed some similar bugs like:
https://bugs.freedesktop.org/show_bug.cgi?id=61321
When I did a quick search on nv4c_mc_oclass I found on the website:
http://lxr.free-electrons.com/ident?v=3.14;i=nv4c_mc_oclass that this
nv4c_mc_oclass is first mentioned in kernel 3.14.
But if you look at the bug report I linked in this comment I found out that
this person also experienced the same problem with the transition of kernel 3.6
to 3.7.
While browsing the kernel source from 3.7 I found out that the value for
device->oclass[NVDEV_SUBDEV_MC still was nv44_mc_oclass.
When you enter this search value 'nv44_mc_oclass' in the free-electrons.com
website and you look at kernel version 3.6 and 3.7 you'll find the
nv44_mc_oclass was first introduced in kernel version 3.7 (where the above
mentioned bug report applies to).
So indeed I think you're thought to disable the MSI in the kernel source will
be the correct decision. But of course that's just my humble opinion.
As said earlier I will report this evening about the change from nv4c_mc_oclass
to nv44_mc_oclass, but given the above bug report I suppose this will
eventually lead to the same result.
Hope I have given you a lot of usefull information about this problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418803312.b5C460.19229
Date: Wed, 17 Dec 2014 08:01:52 +0000
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
   title="NEW - [NV4C] GPU lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV4C] GPU lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361">bug 87361</a>
              from <span class="vcard"><a class="email" href="mailto:jajadekroon&#64;gmail.com" title="Jan Jasper de Kroon &lt;jajadekroon&#64;gmail.com&gt;"> <span class="fn">Jan Jasper de Kroon</span></a>
</span></b>
        <pre>A quick search around the freedesktop.org bugzilla with search criteria NV4C
revealed some similar bugs like:
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="show_bug.cgi?id=61321">https://bugs.freedesktop.org/show_bug.cgi?id=61321</a>
When I did a quick search on nv4c_mc_oclass I found on the website:
<a href="http://lxr.free-electrons.com/ident?v=3.14;i=nv4c_mc_oclass">http://lxr.free-electrons.com/ident?v=3.14;i=nv4c_mc_oclass</a> that this
nv4c_mc_oclass is first mentioned in kernel 3.14.
But if you look at the bug report I linked in this comment I found out that
this person also experienced the same problem with the transition of kernel 3.6
to 3.7.
While browsing the kernel source from 3.7 I found out that the value for
device-&gt;oclass[NVDEV_SUBDEV_MC still was nv44_mc_oclass.
When you enter this search value 'nv44_mc_oclass' in the free-electrons.com
website and you look at kernel version 3.6 and 3.7 you'll find the
nv44_mc_oclass was first introduced in kernel version 3.7 (where the above
mentioned bug report applies to).
So indeed I think you're thought to disable the MSI in the kernel source will
be the correct decision. But of course that's just my humble opinion.
As said earlier I will report this evening about the change from nv4c_mc_oclass
to nv44_mc_oclass, but given the above bug report I suppose this will
eventually lead to the same result.
Hope I have given you a lot of usefull information about this problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418803312.b5C460.19229--

--===============0611130020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0611130020==--
