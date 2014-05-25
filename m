From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79204] [NV50] No reported temperature/fan speed on
	GTX260
Date: Sun, 25 May 2014 17:42:33 +0000
Message-ID: <bug-79204-8800-B6v0oEUFIj@http.bugs.freedesktop.org/>
References: <bug-79204-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0627323418=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79204-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0627323418==
Content-Type: multipart/alternative; boundary="1401039753.dE5d1.26809"; charset="us-ascii"


--1401039753.dE5d1.26809
Date: Sun, 25 May 2014 17:42:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79204

--- Comment #4 from Marcel Dopita <mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> ---
Created attachment 99785
  --> https://bugs.freedesktop.org/attachment.cgi?id=99785&action=edit
sensors (after patch)

Seems that it's reporting accurate values. The temperature seems right and does
change, it has single fan which is adjustable and correctly responds to pwm1
changes after switching to manual mode.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401039753.dE5d1.26809
Date: Sun, 25 May 2014 17:42:33 +0000
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
   title="NEW --- - [NV50] No reported temperature/fan speed on GTX260"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79204#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50] No reported temperature/fan speed on GTX260"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79204">bug 79204</a>
              from <span class="vcard"><a class="email" href="mailto:mdop&#64;seznam.cz" title="Marcel Dopita &lt;mdop&#64;seznam.cz&gt;"> <span class="fn">Marcel Dopita</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=99785" name="attach_99785" title="sensors (after patch)">attachment 99785</a> <a href="attachment.cgi?id=99785&amp;action=edit" title="sensors (after patch)">[details]</a></span>
sensors (after patch)

Seems that it's reporting accurate values. The temperature seems right and does
change, it has single fan which is adjustable and correctly responds to pwm1
changes after switching to manual mode.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401039753.dE5d1.26809--

--===============0627323418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0627323418==--
