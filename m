From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72458] [NV63] Machine freezes when launching Firefox
Date: Mon, 09 Dec 2013 10:47:05 +0000
Message-ID: <bug-72458-8800-syVa8bPvFA@http.bugs.freedesktop.org/>
References: <bug-72458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0081918475=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72458-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0081918475==
Content-Type: multipart/alternative; boundary="1386586025.1bcfFFCa1.5258"; charset="us-ascii"


--1386586025.1bcfFFCa1.5258
Date: Mon, 9 Dec 2013 10:47:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72458

--- Comment #2 from Rebecca Palmer <R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org> ---
> Are you using a libdrm before 2.4.48 also compiled with gcc-4.8?

If it's the one that came with (X)Ubuntu, it's 2.4.46 compiled with gcc 4.8,
but a recent update (3 days before your dmesg log, but I think such updates are
by default installed only weekly) backported that fix
(https://launchpad.net/ubuntu/+source/libdrm/2.4.46-1ubuntu1).

To check whether you have that update, run (in a terminal):
dpkg -s libdrm-nouveau2
Version 2.4.46-1 is unfixed, 2.4.46-1ubuntu1 is fixed.

To install it if you don't have it already, go to System Settings > Software &
Updates > Updates and tick "Recommended updates (saucy-updates)", then run
Software Updater.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386586025.1bcfFFCa1.5258
Date: Mon, 9 Dec 2013 10:47:05 +0000
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
   title="NEW --- - [NV63] Machine freezes when launching Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72458#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV63] Machine freezes when launching Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72458">bug 72458</a>
              from <span class="vcard"><a class="email" href="mailto:R.Palmer&#64;bham.ac.uk" title="Rebecca Palmer &lt;R.Palmer&#64;bham.ac.uk&gt;"> <span class="fn">Rebecca Palmer</span></a>
</span></b>
        <pre><span class="quote">&gt; Are you using a libdrm before 2.4.48 also compiled with gcc-4.8?</span >

If it's the one that came with (X)Ubuntu, it's 2.4.46 compiled with gcc 4.8,
but a recent update (3 days before your dmesg log, but I think such updates are
by default installed only weekly) backported that fix
(<a href="https://launchpad.net/ubuntu/+source/libdrm/2.4.46-1ubuntu1">https://launchpad.net/ubuntu/+source/libdrm/2.4.46-1ubuntu1</a>).

To check whether you have that update, run (in a terminal):
dpkg -s libdrm-nouveau2
Version 2.4.46-1 is unfixed, 2.4.46-1ubuntu1 is fixed.

To install it if you don't have it already, go to System Settings &gt; Software &amp;
Updates &gt; Updates and tick &quot;Recommended updates (saucy-updates)&quot;, then run
Software Updater.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386586025.1bcfFFCa1.5258--

--===============0081918475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0081918475==--
