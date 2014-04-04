From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Fri, 04 Apr 2014 11:28:49 +0000
Message-ID: <bug-59168-8800-EuG10CoyfK@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1800647123=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1800647123==
Content-Type: multipart/alternative; boundary="1396610929.cc8EB1.4698"; charset="us-ascii"


--1396610929.cc8EB1.4698
Date: Fri, 4 Apr 2014 11:28:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #48 from Anssi Hannula <anssi-odJJhXpcy38dnm+yROfE0A@public.gmane.org> ---
I am also still experiencing the same issue on NVCF (nouveau for-next from
earlier today), but it is _NOT_ limited to resume at least in my case. I can
also confirm that nouveau.config=PCE1=0 seems to workaround/fix the issue.

The corruption does not happen immediately, but after using the system for a
long time (days) and/or after running some graphics-intensive games corruptions
start to slowly appear (old random data in various windows).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396610929.cc8EB1.4698
Date: Fri, 4 Apr 2014 11:28:49 +0000
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
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c48">Comment # 48</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:anssi&#64;mageia.org" title="Anssi Hannula &lt;anssi&#64;mageia.org&gt;"> <span class="fn">Anssi Hannula</span></a>
</span></b>
        <pre>I am also still experiencing the same issue on NVCF (nouveau for-next from
earlier today), but it is _NOT_ limited to resume at least in my case. I can
also confirm that nouveau.config=PCE1=0 seems to workaround/fix the issue.

The corruption does not happen immediately, but after using the system for a
long time (days) and/or after running some graphics-intensive games corruptions
start to slowly appear (old random data in various windows).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396610929.cc8EB1.4698--

--===============1800647123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1800647123==--
