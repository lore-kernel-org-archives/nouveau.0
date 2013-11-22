From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71900] [NV40] GPU lockup and segmentation fault of
 Nouveau-1.0.10 on PowerMac G5 with acceleration
Date: Fri, 22 Nov 2013 12:18:06 +0000
Message-ID: <bug-71900-8800-QHjRJ35CIY@http.bugs.freedesktop.org/>
References: <bug-71900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0964094976=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0964094976==
Content-Type: multipart/alternative; boundary="1385122686.EdDAFCa1.11250"; charset="us-ascii"


--1385122686.EdDAFCa1.11250
Date: Fri, 22 Nov 2013 12:18:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71900

--- Comment #5 from dehua.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I updated my system, now with:
kernel 3.12.1
mesa 9.2.3
nouveau 1.9.10
xorg-server 1.14.4
After I put option '"ShadowBF" "true"' in xorg.conf, the nouveau driver works
with acceleration.  In glxinfo it has "direct rendering: Yes", and no nouveau
error in dmesg and Xorg.0.log.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385122686.EdDAFCa1.11250
Date: Fri, 22 Nov 2013 12:18:06 +0000
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
   title="NEW --- - [NV40] GPU lockup and segmentation fault of Nouveau-1.0.10 on PowerMac G5 with acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71900#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV40] GPU lockup and segmentation fault of Nouveau-1.0.10 on PowerMac G5 with acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71900">bug 71900</a>
              from <span class="vcard"><a class="email" href="mailto:dehua.yang&#64;gmail.com" title="dehua.yang&#64;gmail.com">dehua.yang&#64;gmail.com</a>
</span></b>
        <pre>I updated my system, now with:
kernel 3.12.1
mesa 9.2.3
nouveau 1.9.10
xorg-server 1.14.4
After I put option '&quot;ShadowBF&quot; &quot;true&quot;' in xorg.conf, the nouveau driver works
with acceleration.  In glxinfo it has &quot;direct rendering: Yes&quot;, and no nouveau
error in dmesg and Xorg.0.log.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385122686.EdDAFCa1.11250--

--===============0964094976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0964094976==--
