From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Mon, 15 Sep 2014 23:52:50 +0000
Message-ID: <bug-75985-8800-c6rewWZRD5@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1848476362=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1848476362==
Content-Type: multipart/alternative; boundary="1410825170.742f78f1.6831"; charset="us-ascii"


--1410825170.742f78f1.6831
Date: Mon, 15 Sep 2014 23:52:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75985

--- Comment #5 from Jethro Beekman <freedesktop-bugs-LmnypSVwBK6EVqv0pETR8A@public.gmane.org> ---
I've been having a similar issue for a while, see this thread:
https://www.mail-archive.com/dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org/msg45935.html

The workaround you propose (loading nouveau, removing the device, rescanning
the bus) works.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410825170.742f78f1.6831
Date: Mon, 15 Sep 2014 23:52:50 +0000
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
   title="NEW --- - [NVC1] HDMI audio device only visible after rescan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75985#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] HDMI audio device only visible after rescan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75985">bug 75985</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop-bugs&#64;jbeekman.nl" title="Jethro Beekman &lt;freedesktop-bugs&#64;jbeekman.nl&gt;"> <span class="fn">Jethro Beekman</span></a>
</span></b>
        <pre>I've been having a similar issue for a while, see this thread:
<a href="https://www.mail-archive.com/dri-devel&#64;lists.freedesktop.org/msg45935.html">https://www.mail-archive.com/dri-devel&#64;lists.freedesktop.org/msg45935.html</a>

The workaround you propose (loading nouveau, removing the device, rescanning
the bus) works.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410825170.742f78f1.6831--

--===============1848476362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1848476362==--
