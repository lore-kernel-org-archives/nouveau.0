From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92504] [NVA5] Corruption in Plasma 5 on resume after
 changing screen configuration
Date: Mon, 19 Oct 2015 17:42:52 +0000
Message-ID: <bug-92504-8800-CxsdAJsmYv@http.bugs.freedesktop.org/>
References: <bug-92504-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0325305724=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92504-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0325305724==
Content-Type: multipart/alternative; boundary="1445276572.6bd3b0Ad1.20519"; charset="UTF-8"


--1445276572.6bd3b0Ad1.20519
Date: Mon, 19 Oct 2015 17:42:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92504

--- Comment #21 from Alexander Schlarb <alexander-fd-Bd8g6ntRJIRxuZdfhUSrJg@public.gmane.org> ---
Whoa! I really didn't expect that to actually do anything. :-O 
You're a genius!
I've tried multiple suspend-resume cycles, with plugging out and in the
external monitor several times, and no visible glitches and no suspicious
kernel or application logs. Only kernel complaints were about the failing EDID
requests to the external monitor (which tends to happen when you unplug it).

If I'm not mistaken this is just a workaround however, right? We still need to
find out why "nvbo->bo.mem.mem_type == TTM_PL_TT"?

BTW: Thanks for your explanations about the nouveau buf offset! After reading
it a few times I'm now pretty sure I understand roughly what you are doing. :-)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445276572.6bd3b0Ad1.20519
Date: Mon, 19 Oct 2015 17:42:52 +0000
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
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA5] Corruption in Plasma 5 on resume after changing screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92504">bug 92504</a>
              from <span class="vcard"><a class="email" href="mailto:alexander-fd&#64;xmine128.tk" title="Alexander Schlarb &lt;alexander-fd&#64;xmine128.tk&gt;"> <span class="fn">Alexander Schlarb</span></a>
</span></b>
        <pre>Whoa! I really didn't expect that to actually do anything. :-O 
You're a genius!
I've tried multiple suspend-resume cycles, with plugging out and in the
external monitor several times, and no visible glitches and no suspicious
kernel or application logs. Only kernel complaints were about the failing EDID
requests to the external monitor (which tends to happen when you unplug it).

If I'm not mistaken this is just a workaround however, right? We still need to
find out why &quot;nvbo-&gt;bo.mem.mem_type == TTM_PL_TT&quot;?

BTW: Thanks for your explanations about the nouveau buf offset! After reading
it a few times I'm now pretty sure I understand roughly what you are doing. :-)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445276572.6bd3b0Ad1.20519--

--===============0325305724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0325305724==--
