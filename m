From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78116] Auto fan speed management doesn't do anything
 in non critical temperature range (NVC0)
Date: Sat, 10 May 2014 13:12:58 +0000
Message-ID: <bug-78116-8800-bhyslYzaHu@http.bugs.freedesktop.org/>
References: <bug-78116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0270644161=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0270644161==
Content-Type: multipart/alternative; boundary="1399727578.04e3D41.28360"; charset="us-ascii"


--1399727578.04e3D41.28360
Date: Sat, 10 May 2014 13:12:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78116

--- Comment #6 from Marcel Dopita <mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> ---
Created attachment 98820
  --> https://bugs.freedesktop.org/attachment.cgi?id=98820&action=edit
dmesg with PTHERM=debug

Boot with debug parameter, after which I tried case 1b) (switching to manual
mode, changing pwm1 to 100 and switching back to automatic).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399727578.04e3D41.28360
Date: Sat, 10 May 2014 13:12:58 +0000
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
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116">bug 78116</a>
              from <span class="vcard"><a class="email" href="mailto:mdop&#64;seznam.cz" title="Marcel Dopita &lt;mdop&#64;seznam.cz&gt;"> <span class="fn">Marcel Dopita</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=98820" name="attach_98820" title="dmesg with PTHERM=debug">attachment 98820</a> <a href="attachment.cgi?id=98820&amp;action=edit" title="dmesg with PTHERM=debug">[details]</a></span>
dmesg with PTHERM=debug

Boot with debug parameter, after which I tried case 1b) (switching to manual
mode, changing pwm1 to 100 and switching back to automatic).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399727578.04e3D41.28360--

--===============0270644161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0270644161==--
