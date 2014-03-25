From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76605] Screen corruption and crashes in bastion on
 NVS-140M (G86)
Date: Tue, 25 Mar 2014 20:51:12 +0000
Message-ID: <bug-76605-8800-BeJkhkHxRw@http.bugs.freedesktop.org/>
References: <bug-76605-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1865727993=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76605-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1865727993==
Content-Type: multipart/alternative; boundary="1395780672.AFdE01.1699"; charset="us-ascii"


--1395780672.AFdE01.1699
Date: Tue, 25 Mar 2014 20:51:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76605

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Can you check with 3.14-rc8? Alternatively try booting with
nouveau.config=PCRYPT=0. (Although I'm not seeing the MMIO write error that I
would expect to see if you had that particular issue, but it's easy enough to
try.)

The final crash is due to running out of vram, which I guess is handled
less-than-perfectly by mesa. I'd prefer to focus on the initial corruption.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395780672.AFdE01.1699
Date: Tue, 25 Mar 2014 20:51:12 +0000
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
   title="NEW --- - Screen corruption and crashes in bastion on NVS-140M (G86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76605#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen corruption and crashes in bastion on NVS-140M (G86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76605">bug 76605</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Can you check with 3.14-rc8? Alternatively try booting with
nouveau.config=PCRYPT=0. (Although I'm not seeing the MMIO write error that I
would expect to see if you had that particular issue, but it's easy enough to
try.)

The final crash is due to running out of vram, which I guess is handled
less-than-perfectly by mesa. I'd prefer to focus on the initial corruption.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395780672.AFdE01.1699--

--===============1865727993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1865727993==--
