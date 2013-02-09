From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Sat, 09 Feb 2013 04:07:04 +0000
Message-ID: <bug-57350-8800-cS9fLZBbsa@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0706976252=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0706976252==
Content-Type: multipart/alternative; boundary="1360382824.c5Cb14.9404"; charset="us-ascii"


--1360382824.c5Cb14.9404
Date: Sat, 9 Feb 2013 04:07:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

--- Comment #11 from Ankur <ankur-ZXPOjz+jPNRWk0Htik3J/w@public.gmane.org> ---
I also have this issue on a MacBook5,1

Bottom half of mouse cursor is transparent.

There are thousands of "trapped read at ... on channel ... BAR/PFIFO_READ/FB
reason: PAGE_NOT_PRESENT" with occasional "trapped write"s.

All issues resolve after resuming from suspend.

Running Arch Linux (kernel 3.7.5 x86_64)
xf86-video-nouveau 1.0.6
xorg-server 1.12.2
libdrm 2.4.41

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360382824.c5Cb14.9404
Date: Sat, 9 Feb 2013 04:07:04 +0000
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
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:ankur&#64;lipidity.com" title="Ankur &lt;ankur&#64;lipidity.com&gt;"> <span class="fn">Ankur</span></a>
</span></b>
        <pre>I also have this issue on a MacBook5,1

Bottom half of mouse cursor is transparent.

There are thousands of &quot;trapped read at ... on channel ... BAR/PFIFO_READ/FB
reason: PAGE_NOT_PRESENT&quot; with occasional &quot;trapped write&quot;s.

All issues resolve after resuming from suspend.

Running Arch Linux (kernel 3.7.5 x86_64)
xf86-video-nouveau 1.0.6
xorg-server 1.12.2
libdrm 2.4.41</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360382824.c5Cb14.9404--

--===============0706976252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0706976252==--
