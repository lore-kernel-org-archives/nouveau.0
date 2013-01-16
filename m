From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59474] fedora 18 X server crashes after boot
Date: Wed, 16 Jan 2013 18:12:11 +0000
Message-ID: <bug-59474-8800-M6jDDshXOD@http.bugs.freedesktop.org/>
References: <bug-59474-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1551298655=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59474-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1551298655==
Content-Type: multipart/alternative; boundary="1358359931.D0a01.14307"; charset="us-ascii"


--1358359931.D0a01.14307
Date: Wed, 16 Jan 2013 18:12:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59474

--- Comment #3 from Trek <trek00-aPYA7nAdAYY@public.gmane.org> ---
> Xorg.0.log
> Fatal server error:
> [   212.065] xf86OpenConsole: VT_ACTIVATE failed: No such device or address

I think this is the error message and it should refer to a failed open of a
virtual terminal (may be /dev/fb0 or /dev/tty*).

Can you manually switch to other virtual terminals?
Can you manually start X?

Is this issue related?

http://forums.fedoraforum.org/showthread.php?p=1625857


Ciao!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358359931.D0a01.14307
Date: Wed, 16 Jan 2013 18:12:11 +0000
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
   title="NEW --- - fedora 18 X server crashes after boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - fedora 18 X server crashes after boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474">bug 59474</a>
              from <span class="vcard"><a class="email" href="mailto:trek00&#64;inbox.ru" title="Trek &lt;trek00&#64;inbox.ru&gt;"> <span class="fn">Trek</span></a>
</span></b>
        <pre><span class="quote">&gt; Xorg.0.log
&gt; Fatal server error:
&gt; [   212.065] xf86OpenConsole: VT_ACTIVATE failed: No such device or address</span >

I think this is the error message and it should refer to a failed open of a
virtual terminal (may be /dev/fb0 or /dev/tty*).

Can you manually switch to other virtual terminals?
Can you manually start X?

Is this issue related?

<a href="http://forums.fedoraforum.org/showthread.php?p=1625857">http://forums.fedoraforum.org/showthread.php?p=1625857</a>


Ciao!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358359931.D0a01.14307--

--===============1551298655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1551298655==--
