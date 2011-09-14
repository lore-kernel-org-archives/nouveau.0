From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: 3.0.3 nouveau: page allocation failure and oops
Date: Wed, 14 Sep 2011 07:02:35 -0400
Message-ID: <CA+5PVA4WQ3M2NM_BskL4==UwJ_XthVpynmQUHO+1R3-4-XdBRQ@mail.gmail.com>
References: <4E6FFE3E.1090702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E6FFE3E.1090702@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Hancock <hancockrwd@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Tue, Sep 13, 2011 at 9:07 PM, Robert Hancock <hancockrwd@gmail.com> wrote:
> Just saw this page allocation failure followed by a null pointer dereference
> in Fedora 15 2.6.40.3-0 (aka 3.0.3). This is with a GeForce 9600GT. Is this
> already known?

There are a handful of nouveau patches in the newer F15 kernel.  Your
issue looks fairly similar to RH bugzilla 699551.  You should try the
latest stable kernel update (2.6.40.4-5).

josh
