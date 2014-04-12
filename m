From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76818] [NVE7] GPU lockup
Date: Sat, 12 Apr 2014 01:34:17 +0000
Message-ID: <bug-76818-8800-1Apb3yw8MN@http.bugs.freedesktop.org/>
References: <bug-76818-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1429302502=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76818-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1429302502==
Content-Type: multipart/alternative; boundary="1397266457.41cA3.28758"; charset="us-ascii"


--1397266457.41cA3.28758
Date: Sat, 12 Apr 2014 01:34:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76818

--- Comment #9 from jw.hendy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I'm ashamed. I had a stale /etc/modprobe.d/nouveau.conf with noaccel=1 still
set, which is why this worked for me. I, in fact, get the exact same gpu lockup
with the firmware extracted in /usr/lib/nouveau and there has been no
improvement since Oct 2013. I'm inclined to start my own bug report as I'm on a
separet chipset. Sorry for the noise.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397266457.41cA3.28758
Date: Sat, 12 Apr 2014 01:34:17 +0000
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
   title="NEW --- - [NVE7] GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818">bug 76818</a>
              from <span class="vcard"><a class="email" href="mailto:jw.hendy&#64;gmail.com" title="jw.hendy&#64;gmail.com">jw.hendy&#64;gmail.com</a>
</span></b>
        <pre>I'm ashamed. I had a stale /etc/modprobe.d/nouveau.conf with noaccel=1 still
set, which is why this worked for me. I, in fact, get the exact same gpu lockup
with the firmware extracted in /usr/lib/nouveau and there has been no
improvement since Oct 2013. I'm inclined to start my own bug report as I'm on a
separet chipset. Sorry for the noise.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397266457.41cA3.28758--

--===============1429302502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1429302502==--
