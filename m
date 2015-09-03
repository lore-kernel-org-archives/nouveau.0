From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Thu, 03 Sep 2015 11:39:26 +0000
Message-ID: <bug-90871-8800-DFjfMBlq30@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0331887225=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90871-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0331887225==
Content-Type: multipart/alternative; boundary="1441280366.F7efEBCa1.25722"; charset="UTF-8"


--1441280366.F7efEBCa1.25722
Date: Thu, 3 Sep 2015 11:39:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #34 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
Hi,

(In reply to Hans de Goede from comment #32)
> Hi,
> 
> (In reply to Olivier Fourdan from comment #30)
> > You'd need xfwm4 from git master (with opengl support) to reproduce or
> > simply use the simple reproducer I attached to this bug some time ago
> > (attachment 116536 [details])
> 
> Ok, I just tried with that reproducer, but that also does not reproduce.
> 
> I've ordered a quadro nvs280, which is about the only nv3x card with a pci-e
> interface available. When that arrives I'll try again.

Ok' I've received this card now, and I can reproduce the problem. I'll
investigate and try to fix this next week.

Regards,

Hans

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441280366.F7efEBCa1.25722
Date: Thu, 3 Sep 2015 11:39:26 +0000
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
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>Hi,

(In reply to Hans de Goede from <a href="show_bug.cgi?id=90871#c32">comment #32</a>)
<span class="quote">&gt; Hi,
&gt; 
&gt; (In reply to Olivier Fourdan from <a href="show_bug.cgi?id=90871#c30">comment #30</a>)
&gt; &gt; You'd need xfwm4 from git master (with opengl support) to reproduce or
&gt; &gt; simply use the simple reproducer I attached to this bug some time ago
&gt; &gt; (<span class=""><a href="attachment.cgi?id=116536" name="attach_116536" title="test program">attachment 116536</a> <a href="attachment.cgi?id=116536&amp;action=edit" title="test program">[details]</a></span>)
&gt; 
&gt; Ok, I just tried with that reproducer, but that also does not reproduce.
&gt; 
&gt; I've ordered a quadro nvs280, which is about the only nv3x card with a pci-e
&gt; interface available. When that arrives I'll try again.</span >

Ok' I've received this card now, and I can reproduce the problem. I'll
investigate and try to fix this next week.

Regards,

Hans</pre>
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

--1441280366.F7efEBCa1.25722--

--===============0331887225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0331887225==--
