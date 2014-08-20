From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82834] [NV92] GeForce 8800 GS shows incorrect
 temperature with nouveau
Date: Wed, 20 Aug 2014 21:42:36 +0000
Message-ID: <bug-82834-8800-uTGSO1Xi9v@http.bugs.freedesktop.org/>
References: <bug-82834-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1660900728=="
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


--===============1660900728==
Content-Type: multipart/alternative; boundary="1408570956.b225C2.7306"; charset="us-ascii"


--1408570956.b225C2.7306
Date: Wed, 20 Aug 2014 21:42:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82834

--- Comment #7 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #6)
> Hm, log  should  be available as
> https://bugs.freedesktop.org/attachment.cgi?id=104991 (at 11.55 you  can see
> "[11.544288] nouveau D[     I2C][0000:05:00.0] using custom udelay 100
> instead of 10" - I assumed  it  worked at this stage. But then - I saw  no
> another  nouveau adapter ..what if nouveau just stops  adding sensors  after
> finding  'ghost' internal thermal sensor  ?

Nah, that's not how the code works. Can you test with the proprietary driver to
see if it exposes a temperature? If it does work, could you make a mmiotrace of
it, please?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408570956.b225C2.7306
Date: Wed, 20 Aug 2014 21:42:36 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82834#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS shows incorrect temperature with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82834">bug 82834</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=82834#c6">comment #6</a>)
<span class="quote">&gt; Hm, log  should  be available as
&gt; <a href="https://bugs.freedesktop.org/attachment.cgi?id=104991">https://bugs.freedesktop.org/attachment.cgi?id=104991</a> (at 11.55 you  can see
&gt; &quot;[11.544288] nouveau D[     I2C][0000:05:00.0] using custom udelay 100
&gt; instead of 10&quot; - I assumed  it  worked at this stage. But then - I saw  no
&gt; another  nouveau adapter ..what if nouveau just stops  adding sensors  after
&gt; finding  'ghost' internal thermal sensor  ?</span >

Nah, that's not how the code works. Can you test with the proprietary driver to
see if it exposes a temperature? If it does work, could you make a mmiotrace of
it, please?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408570956.b225C2.7306--

--===============1660900728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1660900728==--
