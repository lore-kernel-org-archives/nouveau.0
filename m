From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Sun, 27 Jan 2013 04:15:46 +0000
Message-ID: <bug-57350-8800-XPqPOxNViA@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0276152503=="
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


--===============0276152503==
Content-Type: multipart/alternative; boundary="1359260146.bf6Ea24.31175"; charset="us-ascii"


--1359260146.bf6Ea24.31175
Date: Sun, 27 Jan 2013 04:15:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

--- Comment #10 from alzeih-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Also happens on my MacBookPro6,2

lspci -nn | grep VGA:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT216 [GeForce GT
330M] [10de:0a29] (rev a2)

from dmesg:

[ 1678.891945] nouveau E[     PFB][0000:01:00.0] trapped read at 0x00007139c0
on channel 0x0001fed0 BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT

Workaround mentioned with suspend/resume also works for me.

Running kernel config attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359260146.bf6Ea24.31175
Date: Sun, 27 Jan 2013 04:15:46 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:alzeih&#64;gmail.com" title="alzeih&#64;gmail.com">alzeih&#64;gmail.com</a>
</span></b>
        <pre>Also happens on my MacBookPro6,2

lspci -nn | grep VGA:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT216 [GeForce GT
330M] [10de:0a29] (rev a2)

from dmesg:

[ 1678.891945] nouveau E[     PFB][0000:01:00.0] trapped read at 0x00007139c0
on channel 0x0001fed0 BAR/PFIFO_READ/FB reason: PAGE_NOT_PRESENT

Workaround mentioned with suspend/resume also works for me.

Running kernel config attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359260146.bf6Ea24.31175--

--===============0276152503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0276152503==--
