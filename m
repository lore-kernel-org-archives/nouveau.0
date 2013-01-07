From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58729] [bisected] Display fails to turn on after
 suspend/resume (NV86)
Date: Mon, 07 Jan 2013 19:23:49 +0000
Message-ID: <bug-58729-8800-oiUfP5ehbQ@http.bugs.freedesktop.org/>
References: <bug-58729-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0025879379=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58729-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0025879379==
Content-Type: multipart/alternative; boundary="1357586629.8FEd8e0.897"; charset="us-ascii"


--1357586629.8FEd8e0.897
Date: Mon, 7 Jan 2013 19:23:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58729

--- Comment #6 from J Binder <wheel-pGoT+mvyLdp4LYgiJMQgWbNAH6kLmebB@public.gmane.org> ---
Created attachment 72647
  --> https://bugs.freedesktop.org/attachment.cgi?id=72647&action=edit
dmesg for boot and one suspend/resume cycle with 3.8.0-rc2 form today's git
master with mask patch from bug 59057

Patch from comment 15, bug 59057 does not make a difference.

Looking more closely, I probably have the same machine as Pontus Fuchs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357586629.8FEd8e0.897
Date: Mon, 7 Jan 2013 19:23:49 +0000
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
   title="NEW --- - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729">bug 58729</a>
              from <span class="vcard"><a class="email" href="mailto:wheel&#64;herr-der-mails.de" title="J Binder &lt;wheel&#64;herr-der-mails.de&gt;"> <span class="fn">J Binder</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72647" name="attach_72647" title="dmesg for boot and one suspend/resume cycle with 3.8.0-rc2 form today's git master with mask patch from bug 59057">attachment 72647</a> <a href="attachment.cgi?id=72647&amp;action=edit" title="dmesg for boot and one suspend/resume cycle with 3.8.0-rc2 form today's git master with mask patch from bug 59057">[details]</a></span>
dmesg for boot and one suspend/resume cycle with 3.8.0-rc2 form today's git
master with mask patch from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Black screen after resume from s2ram"
   href="show_bug.cgi?id=59057">bug 59057</a>

Patch from <a href="show_bug.cgi?id=58729#c15">comment 15</a>, <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Black screen after resume from s2ram"
   href="show_bug.cgi?id=59057">bug 59057</a> does not make a difference.

Looking more closely, I probably have the same machine as Pontus Fuchs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357586629.8FEd8e0.897--

--===============0025879379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0025879379==--
