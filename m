From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: Google's Chrome Team might Blacklist Nouveau on
 Chromium
Date: Wed, 26 Sep 2018 11:52:33 +0100
Message-ID: <f760ce1c-b5bd-cd8f-faf3-111948d4ac37@spliet.org>
References: <CAB15_AMQ8Mxy9AuXBY8R4W=Ek3_XsJzLE68xO-+OAcwT5Am9Mw@mail.gmail.com>
 <CAH0ntzyNrytnbmixkx7hdNBLikWCkqRtRq04qXeONhi6zkhcVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1209155470=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAH0ntzyNrytnbmixkx7hdNBLikWCkqRtRq04qXeONhi6zkhcVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1209155470==
Content-Type: multipart/alternative;
 boundary="------------F9F86BC50836B32830CACBC7"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------F9F86BC50836B32830CACBC7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I don't think any nouveau dev would disagree with the choice for a 
software rendered browser over an unreliable browser. Insofar I still 
count as a nouveau dev, I'll back this decision because it benefits user 
experience.
What is disappointing though is that when I perform a search on our bug 
tracker (see [0] and [1]), I find precisely _one_ relevant bug. Shame on 
us for not following up on that one, but shame on the Chrome developers 
to decide they'd rather blacklist a driver than publicly* reach out and 
ask what's going on. Blacklisting 3D rendering on nouveau isn't going to 
fix nouveau, it's a short-term improvement with no long term prospect.

On 26/09/18 11:25, Megaf wrote:
> Well, I agree with them.
> Nouveau is extremely unstable on my MacBook Pro with Nvidia 320M, 
> freezing all the time and draining a lot of battery.
> Performance wise is not too bad tho.
> There's plenty of reported bugs already around the web if someone 
> wants to investigate it.
Don't take this as personal criticism, I really appreciate the fact that 
you reach out and bring this to our attention. What I do wish to point 
out to anyone is that there are too many projects with too many bug 
trackers out there to track all of them. In reality nouveau devs monitor 
the nouveau bugtracker [2], and if you're lucky the tracker of their 
favourite distro. I don't believe it's feasible to expect driver devs to 
track more - we're already grossly under"staffed". Sure, Chrome is a 
popular piece of software, but so is Firefox, LibreOffice, VirtualBox, 
Wine, Dolphin, Gnome Shell etc. etc... So my advice to anyone: if you 
want bugs actually fixed in nouveau, do your civil duty and file them in 
the nouveau bugtracker.

Roy

[0] 
https://bugs.freedesktop.org/buglist.cgi?bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&bug_status=NEEDINFO&component=Driver%2Fnouveau&product=xorg&query_format=advanced&short_desc=chrome&short_desc_type=allwordssubstr
[1] 
https://bugs.freedesktop.org/buglist.cgi?bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&bug_status=NEEDINFO&component=Drivers%2FDRI%2Fnouveau&product=Mesa&query_format=advanced&short_desc=chrome&short_desc_type=allwordssubstr
[2] https://nouveau.freedesktop.org/wiki/Bugs/

* I'm aware that a sizeable portion of the workforce behind nouveau is 
currently employed by Red Hat. What happens behind their scenes is 
unknown to me and other contributors...
>
> Thanks
> Megaf
> https://www.megaf.info/
>
> email: mmegaf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <mailto:mmegaf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> skype: eumegaf
> discord: Megaf#6582
>
>
> On Sun, 23 Sep 2018 at 04:06, Matthew Ary <matthewj.c.ary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 
> <mailto:matthewj.c.ary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
>
>
>     I thought you all would like to know that Google considers Nouveau
>     to be unstable and is now actively considering blacklisting.
>     Please see this issue on their issue tracker.
>
>     https://bugs.chromium.org/p/chromium/issues/detail?id=876523
>     _______________________________________________
>     Nouveau mailing list
>     Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org <mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
>     https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--------------F9F86BC50836B32830CACBC7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    I don't think any nouveau dev would disagree with the choice for a
    software rendered browser over an unreliable browser. Insofar I
    still count as a nouveau dev, I'll back this decision because it
    benefits user experience.<br>
    What is disappointing though is that when I perform a search on our
    bug tracker (see [0] and [1]), I find precisely _one_ relevant bug.
    Shame on us for not following up on that one, but shame on the
    Chrome developers to decide they'd rather blacklist a driver than
    publicly* reach out and ask what's going on. Blacklisting 3D
    rendering on nouveau isn't going to fix nouveau, it's a short-term
    improvement with no long term prospect.<br>
    <br>
    <div class="moz-cite-prefix">On 26/09/18 11:25, Megaf wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAH0ntzyNrytnbmixkx7hdNBLikWCkqRtRq04qXeONhi6zkhcVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_default"
          style="font-family:monospace,monospace;font-size:small;color:#444444">Well,
          I agree with them.</div>
        <div class="gmail_default"
          style="font-family:monospace,monospace;font-size:small;color:#444444">Nouveau
          is extremely unstable on my MacBook Pro with Nvidia 320M,
          freezing all the time and draining a lot of battery.</div>
        <div class="gmail_default"
          style="font-family:monospace,monospace;font-size:small;color:#444444">Performance
          wise is not too bad tho.</div>
        <div class="gmail_default"
          style="font-family:monospace,monospace;font-size:small;color:#444444">There's
          plenty of reported bugs already around the web if someone
          wants to investigate it.</div>
      </div>
    </blockquote>
    Don't take this as personal criticism, I really appreciate the fact
    that you reach out and bring this to our attention. What I do wish
    to point out to anyone is that there are too many projects with too
    many bug trackers out there to track all of them. In reality nouveau
    devs monitor the nouveau bugtracker [2], and if you're lucky the
    tracker of their favourite distro. I don't believe it's feasible to
    expect driver devs to track more - we're already grossly
    under"staffed". Sure, Chrome is a popular piece of software, but so
    is Firefox, LibreOffice, VirtualBox, Wine, Dolphin, Gnome Shell etc.
    etc... So my advice to anyone: if you want bugs actually fixed in
    nouveau, do your civil duty and file them in the nouveau bugtracker.<br>
    <br>
    Roy<br>
    <br>
    [0]
<a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/buglist.cgi?bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=REOPENED&amp;bug_status=NEEDINFO&amp;component=Driver%2Fnouveau&amp;product=xorg&amp;query_format=advanced&amp;short_desc=chrome&amp;short_desc_type=allwordssubstr">https://bugs.freedesktop.org/buglist.cgi?bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=REOPENED&amp;bug_status=NEEDINFO&amp;component=Driver%2Fnouveau&amp;product=xorg&amp;query_format=advanced&amp;short_desc=chrome&amp;short_desc_type=allwordssubstr</a><br>
    [1]
<a class="moz-txt-link-freetext" href="https://bugs.freedesktop.org/buglist.cgi?bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=REOPENED&amp;bug_status=NEEDINFO&amp;component=Drivers%2FDRI%2Fnouveau&amp;product=Mesa&amp;query_format=advanced&amp;short_desc=chrome&amp;short_desc_type=allwordssubstr">https://bugs.freedesktop.org/buglist.cgi?bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=REOPENED&amp;bug_status=NEEDINFO&amp;component=Drivers%2FDRI%2Fnouveau&amp;product=Mesa&amp;query_format=advanced&amp;short_desc=chrome&amp;short_desc_type=allwordssubstr</a><br>
    [2] <a class="moz-txt-link-freetext" href="https://nouveau.freedesktop.org/wiki/Bugs/">https://nouveau.freedesktop.org/wiki/Bugs/</a><br>
    <br>
    * I'm aware that a sizeable portion of the workforce behind nouveau
    is currently employed by Red Hat. What happens behind their scenes
    is unknown to me and other contributors...<br>
    <blockquote type="cite"
cite="mid:CAH0ntzyNrytnbmixkx7hdNBLikWCkqRtRq04qXeONhi6zkhcVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org">
      <div dir="ltr">
        <div class="gmail_default"
          style="font-family:monospace,monospace;font-size:small;color:#444444"><br>
        </div>
        <div>
          <div dir="ltr" class="gmail_signature"
            data-smartmail="gmail_signature">
            <div dir="ltr"><font color="#444444" face="monospace,
                monospace">Thanks</font>
              <div>
                <div><font color="#444444" face="monospace, monospace">Megaf</font></div>
                <div><font color="#444444" face="monospace, monospace"><a
                      href="https://www.megaf.info/" target="_blank"
                      moz-do-not-send="true">https://www.megaf.info/</a></font></div>
                <div><font color="#444444" face="monospace, monospace"><br>
                  </font></div>
                <div><font color="#444444" face="monospace, monospace">email:
                    <a href="mailto:mmegaf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target="_blank"
                      moz-do-not-send="true">mmegaf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a></font></div>
              </div>
              <div><font color="#444444" face="monospace, monospace">skype:
                  eumegaf</font></div>
              <div><font color="#444444" face="monospace, monospace">discord:
                  Megaf#6582</font></div>
            </div>
          </div>
        </div>
        <br>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Sun, 23 Sep 2018 at 04:06, Matthew Ary &lt;<a
            href="mailto:matthewj.c.ary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org"
            moz-do-not-send="true">matthewj.c.ary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div dir="ltr">
            <div dir="ltr"><br clear="all">
              <div>
                <div dir="ltr"
                  class="m_5909146353043396423gmail_signature">
                  <div dir="ltr">
                    <div>I thought you all would like to know that
                      Google considers Nouveau to be unstable and is now
                      actively considering blacklisting. Please see this
                      issue on their issue tracker.</div>
                    <div><br>
                    </div>
                    <div><a
                        href="https://bugs.chromium.org/p/chromium/issues/detail?id=876523"
                        target="_blank" moz-do-not-send="true">https://bugs.chromium.org/p/chromium/issues/detail?id=876523</a><br>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          _______________________________________________<br>
          Nouveau mailing list<br>
          <a href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target="_blank"
            moz-do-not-send="true">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
          <a
            href="https://lists.freedesktop.org/mailman/listinfo/nouveau"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
        </blockquote>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Nouveau mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F9F86BC50836B32830CACBC7--

--===============1209155470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1209155470==--
