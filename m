From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Sun, 28 Sep 2014 01:36:59 +0000
Message-ID: <bug-27501-8800-KJa4t43iGD@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1437791555=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1437791555==
Content-Type: multipart/alternative; boundary="1411868219.f86FF6.27437"; charset="us-ascii"


--1411868219.f86FF6.27437
Date: Sun, 28 Sep 2014 01:36:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #39 from thomas <gurutonic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Pierre,

I have tested your patch with the 9400M in my macbookpro 5,2. The card boots
correctly with acceleration enabled, and loads GDM. GDM looks completely
correct, but hangs on login with a cursor on a grey screen. It's possible that
LXDE, KDE, or some other DE might work, but gnome-shell never loads. I will try
slim/lxde when I get a chance.

At this point I can switch back to VT where I notice some nouveau errors in
dmesg. Killing GDM (and x11 with it) produces a kernel panic.

Next I booted with the 9600GT with acceleration disabled. The display looks
correct with efifb, but loading nouveau scrambles the VT.

Thank you for your efforts!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411868219.f86FF6.27437
Date: Sun, 28 Sep 2014 01:36:59 +0000
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
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c39">Comment # 39</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:gurutonic&#64;gmail.com" title="thomas &lt;gurutonic&#64;gmail.com&gt;"> <span class="fn">thomas</span></a>
</span></b>
        <pre>Pierre,

I have tested your patch with the 9400M in my macbookpro 5,2. The card boots
correctly with acceleration enabled, and loads GDM. GDM looks completely
correct, but hangs on login with a cursor on a grey screen. It's possible that
LXDE, KDE, or some other DE might work, but gnome-shell never loads. I will try
slim/lxde when I get a chance.

At this point I can switch back to VT where I notice some nouveau errors in
dmesg. Killing GDM (and x11 with it) produces a kernel panic.

Next I booted with the 9600GT with acceleration disabled. The display looks
correct with efifb, but loading nouveau scrambles the VT.

Thank you for your efforts!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411868219.f86FF6.27437--

--===============1437791555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1437791555==--
