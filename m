From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71357] [NVC1] After S3 resume X is broken and reboot
	needed
Date: Wed, 16 Sep 2015 14:25:11 +0000
Message-ID: <bug-71357-8800-1CSZMVbDK1@http.bugs.freedesktop.org/>
References: <bug-71357-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0086937947=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71357-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0086937947==
Content-Type: multipart/alternative; boundary="1442413511.18f1B0.30639"; charset="UTF-8"


--1442413511.18f1B0.30639
Date: Wed, 16 Sep 2015 14:25:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71357

--- Comment #10 from Torsten Krah <krah.tm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,

i did what you've suggested and used 4.3.0-040300rc1-generic #201509160642 SMP
build from ubuntu mainline ppa.
And i am really happy - did S3 twice and all works fine, its waking up and
works - i can even do S3 twice, resume and it works. Even KernelModeSetting on
console does work flawlessly now where 3.13 did work and 3.16 did not with my
external monitors, thumbs up - seems fixed with 4.3-rc1.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442413511.18f1B0.30639
Date: Wed, 16 Sep 2015 14:25:11 +0000
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
   title="NEW - [NVC1] After S3 resume X is broken and reboot needed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71357#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] After S3 resume X is broken and reboot needed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71357">bug 71357</a>
              from <span class="vcard"><a class="email" href="mailto:krah.tm&#64;gmail.com" title="Torsten Krah &lt;krah.tm&#64;gmail.com&gt;"> <span class="fn">Torsten Krah</span></a>
</span></b>
        <pre>Hi,

i did what you've suggested and used 4.3.0-040300rc1-generic #201509160642 SMP
build from ubuntu mainline ppa.
And i am really happy - did S3 twice and all works fine, its waking up and
works - i can even do S3 twice, resume and it works. Even KernelModeSetting on
console does work flawlessly now where 3.13 did work and 3.16 did not with my
external monitors, thumbs up - seems fixed with 4.3-rc1.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442413511.18f1B0.30639--

--===============0086937947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0086937947==--
