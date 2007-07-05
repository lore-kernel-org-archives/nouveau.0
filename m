From: Pekka Paalanen <pq@iki.fi>
Subject: Re: [Nouveau] Question About The Steps
Date: Thu, 5 Jul 2007 11:44:10 +0300
Message-ID: <20070705114410.77225c82@daedalus.pq.iki.fi>
References: <20070704124117.26312d4d@daedalus.pq.iki.fi>
	<BAY122-F2108C326D8BAFA8154F58CCE020@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.sourceforge.net>
In-Reply-To: <BAY122-F2108C326D8BAFA8154F58CCE020@phx.gbl>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dri-devel>
List-Post: <mailto:dri-devel@lists.sourceforge.net>
List-Help: <mailto:dri-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=subscribe>
Sender: dri-devel-bounces@lists.sourceforge.net
Errors-To: dri-devel-bounces@lists.sourceforge.net
To: xiao dan <xiaodanbox@hotmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.sourceforge.net
List-Id: nouveau.vger.kernel.org

People, when you reply, please drop nouveau@ from CC list, as this is
not Nouveau-specific.

My comments are mixed in the first quoted e-mail.

Thanks.


On Thu, 05 Jul 2007 09:35:24 +0800
"xiao dan" <xiaodanbox@hotmail.com> wrote:

> Dear Sir:
>      Thanks a lot for your reply.Here is the details:
>      1>The hardware we have now is the ATI Radeon 9000(For
>      1>students,money 
> is the biggest problem).

Nouveau deals with Nvidia graphics. Proprietary Radeon drivers work a
little different and the radeon project uses different reverse
engineering tools. I do not know much about those.

>      2>The operating system we currently use is Redhat 9.0.

You do know this OS died in 2004 and even Fedora Legacy shut down early
this year?
http://en.wikipedia.org/wiki/Red_Hat_Linux

>      3>What exactly we want to do is to get the work mechanism of the
>      3>ATI 
> driver from the binary codes under the OS.

What do you mean by this? Are you proposing to clean-room reverse
engineer (possibly disassemble) the proprietary driver, and write the
documentation for someone else, who will then write a driver?
There are legal issues involved, so please be very specific about what
you want to do, or are going to do. It may make the difference between
your contribution being a valuable benefit or completely useless for
the community.

You also said you are a graduate student. Is this supposed to be
related your scientific work, and how?

As far as I can tell, there already are (fully?) working open source
radeon drivers for 9000 cards.
http://dri.freedesktop.org/wiki/ATI

I do not know much about the radeon development, but I'm sure you find
the people on dri-devel mailing list (CC'd here).
Perhaps The irregular Radeon Development Companion can provide you
more pointers: http://tirdc.livejournal.com/

>      4>The members of our team are all students.We are interested in
>      4>this.
>      The biggest problem for us is that how to get the work mechanism
> of the driver from the binary codes or how the dirver works in the
> linux. Waiting for your reply thirstily! Thanks a lot!
>                                                            yours,
>                                                               shadow
>      
> 
> >From: Pekka Paalanen <pq@iki.fi>
> >To: "xiao dan" <xiaodanbox@hotmail.com>
> >CC: nouveau@lists.freedesktop.org
> >Subject: Re: [Nouveau] Question About The Steps
> >Date: Wed, 4 Jul 2007 12:41:17 +0300
> >
> >On Wed, 04 Jul 2007 10:47:46 +0800
> >"xiao dan" <xiaodanbox@hotmail.com> wrote:
> >
> > > Dear Sir:
> > >      Sorry to  bother you! I am a graduate student in China,and my
> > > team is currently working on the video card driver. Our target is
> > > that the result we get can be used in some kind of Operating
> > > System like linux. As newers,the biggest problom for us is that
> > > the steps to do the work is not very clear. It will be very kind
> > > of you to give us a picture of the proceeding. We have the basic
> > > knowledge,but don't know which point to start.
> >
> >Hello,
> >
> >at least I did not really understand your question, so I'm asking
> >more details.
> >
> >By the video card driver do you mean Nouveau?
> >What hardware are you working with?
> >By operating system do you mean specifically Linux, or *BSD or
> >something else?
> >What is it exactly what you want to do?
> >Would you be contributing to the Nouveau code base, under the
> >propriate licenses and legal terms?
> >
> >Thanks.
> >


-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/

-------------------------------------------------------------------------
This SF.net email is sponsored by DB2 Express
Download DB2 Express C - the FREE version of DB2 express and take
control of your XML. No limits. Just data. Click to get it now.
http://sourceforge.net/powerbar/db2/
--
