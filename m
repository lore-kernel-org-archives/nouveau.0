From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91598] Broken Rendering of Plasma 5 Desktop
Date: Sun, 16 Aug 2015 23:49:23 +0000
Message-ID: <bug-91598-8800-gguIn27KWv@http.bugs.freedesktop.org/>
References: <bug-91598-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1686102741=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91598-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1686102741==
Content-Type: multipart/alternative; boundary="1439768963.Ecf0C1.19532"; charset="UTF-8"


--1439768963.Ecf0C1.19532
Date: Sun, 16 Aug 2015 23:49:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91598

--- Comment #10 from David March <davidmarch007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
@Ilia Mirkin, I attempted to get an aptitrace and tried it for over an hour.
Unfortunately the problem did not recur even though it usually happens a couple
times a day.  I did notice the application.trace file was over 5.4 GB though. 
I read that there is a way to truncate it.  If I am able to get it to recur
again while using it, would it be acceptable to truncate it to a few minutes
before where the issue first appears?  This is my first time using that
particular utility so I am unsure as to what is useful and what is not.  Also I
am just killing the existing plasmashell instance and then running 'apitrace
trace /usr/bin/plasmashell'.  I presume this is the proper way to invoke it per
the manual?  Since plasmashell is technically the application generating the
errors?

On a positive note while I was not running apitrace earlier the problem did
recur and I was able to confirm again that by closing all applications and
waiting a minute or two the display returns to normal and does not recur or
generate errors in 'dmesg' for a significant period of time.  That is probably
a hint as to what is happening?

I will keep trying for a good apitrace as time permits.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439768963.Ecf0C1.19532
Date: Sun, 16 Aug 2015 23:49:23 +0000
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
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598">bug 91598</a>
              from <span class="vcard"><a class="email" href="mailto:davidmarch007&#64;gmail.com" title="David March &lt;davidmarch007&#64;gmail.com&gt;"> <span class="fn">David March</span></a>
</span></b>
        <pre>&#64;Ilia Mirkin, I attempted to get an aptitrace and tried it for over an hour.
Unfortunately the problem did not recur even though it usually happens a couple
times a day.  I did notice the application.trace file was over 5.4 GB though. 
I read that there is a way to truncate it.  If I am able to get it to recur
again while using it, would it be acceptable to truncate it to a few minutes
before where the issue first appears?  This is my first time using that
particular utility so I am unsure as to what is useful and what is not.  Also I
am just killing the existing plasmashell instance and then running 'apitrace
trace /usr/bin/plasmashell'.  I presume this is the proper way to invoke it per
the manual?  Since plasmashell is technically the application generating the
errors?

On a positive note while I was not running apitrace earlier the problem did
recur and I was able to confirm again that by closing all applications and
waiting a minute or two the display returns to normal and does not recur or
generate errors in 'dmesg' for a significant period of time.  That is probably
a hint as to what is happening?

I will keep trying for a good apitrace as time permits.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439768963.Ecf0C1.19532--

--===============1686102741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1686102741==--
