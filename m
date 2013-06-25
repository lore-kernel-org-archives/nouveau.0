From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66177] pwm1 value not restored during
 hibernate/restore cycle in the event of manual fan management mode
Date: Tue, 25 Jun 2013 22:32:02 +0000
Message-ID: <bug-66177-8800-h1fdexd18Q@http.bugs.freedesktop.org/>
References: <bug-66177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1761692941=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66177-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1761692941==
Content-Type: multipart/alternative; boundary="1372199522.aeBa1.9401"; charset="us-ascii"


--1372199522.aeBa1.9401
Date: Tue, 25 Jun 2013 22:32:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66177

--- Comment #2 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
Created attachment 81431
  --> https://bugs.freedesktop.org/attachment.cgi?id=81431&action=edit
set fan_mode and fan_duty at boot up

The following patch allows fan_mode and fan_duty (percentage) to be specified
at the kernel command line

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372199522.aeBa1.9401
Date: Tue, 25 Jun 2013 22:32:02 +0000
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
   title="NEW --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177">bug 66177</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=81431" name="attach_81431" title="set fan_mode and fan_duty at boot up">attachment 81431</a> <a href="attachment.cgi?id=81431&amp;action=edit" title="set fan_mode and fan_duty at boot up">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=66177&amp;attachment=81431'>[review]</a>
set fan_mode and fan_duty at boot up

The following patch allows fan_mode and fan_duty (percentage) to be specified
at the kernel command line</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372199522.aeBa1.9401--

--===============1761692941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1761692941==--
