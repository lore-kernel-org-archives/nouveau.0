From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94637] system crash, no messages, GT215,
 ubuntu 16.04 when running glmark2 for a few minutes.
Date: Sun, 20 Mar 2016 15:21:12 +0000
Message-ID: <bug-94637-8800-ms9NfgKfY5@http.bugs.freedesktop.org/>
References: <bug-94637-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1135031008=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94637-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1135031008==
Content-Type: multipart/alternative; boundary="14584872720.B6aB5F.25248";
 charset="UTF-8"


--14584872720.B6aB5F.25248
Date: Sun, 20 Mar 2016 15:21:12 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94637

--- Comment #10 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
(In reply to Pierre Moreau from comment #8)
> Sadly there is nothing wrong in the dmesg… Maybe run `cat /dev/kmsg >
> somefile.txt&` and see if after crashing the computer, somefile.txt contains
> some more information.

I fear that when the kernel crashes, all the filesystem stuff is gone already.
Maybe in the end he needs to setup netconsole

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14584872720.B6aB5F.25248
Date: Sun, 20 Mar 2016 15:21:12 +0000
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
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637">bug 94637</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href="show_bug.cgi?id=94637#c8">comment #8</a>)
<span class="quote">&gt; Sadly there is nothing wrong in the dmesg… Maybe run `cat /dev/kmsg &gt;
&gt; somefile.txt&amp;` and see if after crashing the computer, somefile.txt contains
&gt; some more information.</span >

I fear that when the kernel crashes, all the filesystem stuff is gone already.
Maybe in the end he needs to setup netconsole</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14584872720.B6aB5F.25248--

--===============1135031008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1135031008==--
