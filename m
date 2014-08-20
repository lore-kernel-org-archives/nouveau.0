From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82834] [NV92] GeForce 8800 GS shows incorrect
 temperature with nouveau
Date: Wed, 20 Aug 2014 19:16:32 +0000
Message-ID: <bug-82834-8800-eavpLGnesh@http.bugs.freedesktop.org/>
References: <bug-82834-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0394760400=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82834-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0394760400==
Content-Type: multipart/alternative; boundary="1408562192.D45841.22959"; charset="us-ascii"


--1408562192.D45841.22959
Date: Wed, 20 Aug 2014 19:16:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82834

--- Comment #6 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Hm, log  should  be available as
https://bugs.freedesktop.org/attachment.cgi?id=104991 (at 11.55 you  can see 
"[11.544288] nouveau D[     I2C][0000:05:00.0] using custom udelay 100 instead
of 10" - I assumed  it  worked at this stage. But then - I saw  no another 
nouveau adapter ..what if nouveau just stops  adding sensors  after  finding 
'ghost' internal thermal sensor  ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408562192.D45841.22959
Date: Wed, 20 Aug 2014 19:16:32 +0000
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
   title="NEW --- - [NV92] GeForce 8800 GS shows incorrect temperature with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82834#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS shows incorrect temperature with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82834">bug 82834</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Hm, log  should  be available as
<a href="https://bugs.freedesktop.org/attachment.cgi?id=104991">https://bugs.freedesktop.org/attachment.cgi?id=104991</a> (at 11.55 you  can see 
&quot;[11.544288] nouveau D[     I2C][0000:05:00.0] using custom udelay 100 instead
of 10&quot; - I assumed  it  worked at this stage. But then - I saw  no another 
nouveau adapter ..what if nouveau just stops  adding sensors  after  finding 
'ghost' internal thermal sensor  ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408562192.D45841.22959--

--===============0394760400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0394760400==--
